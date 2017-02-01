//
//  ViewController.m
//  2-4-4
//
//  Created by 林俊太朗 on 2017/02/01.
//  Copyright © 2017年 林俊太朗. All rights reserved.
//

#import "ViewController.h"
#import "FMDbConect.h"
#import "AFNetworking.h"

NSString *const base_url = @"http://weather.livedoor.com/forecast/webservice/json/v1";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController{
    NSArray<NSDictionary *> *forecasts;
    NSMutableDictionary *images;
}
- (void)getForcasts:(NSString *)cityCode{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:[base_url stringByAppendingString:cityCode] parameters:nil progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
            // json取得に成功した場合の処理
            @try {
                for(NSDictionary *response in responseObject[@"forecasts"]){
                    NSString *selectSql = [NSString stringWithFormat:@"SELECT forecast_id FROM tr_forecast WHERE date = '%@'",response[@"date"]];
                    NSArray *data = @[@"forecast_id"];
                    NSArray *workspace = [FMDbConect selectFromSql:selectSql :data];
                    if(workspace.count != 0){
                        NSString *updateSql = @"UPDATE tr_forecast SET telop = ?, image_url = ? WHERE date = ?";
                        NSArray *data = @[response[@"telop"],response[@"image"][@"url"],response[@"date"]];
                        [FMDbConect updateFromString:updateSql :data];
                    }else{
                          NSString *insertString = @"INSERT INTO tr_forecast(date,telop,image_url) VALUES(?,?,?)";
                          NSArray *data = @[response[@"date"],response[@"telop"],response[@"image"][@"url"]];
                          [FMDbConect insertFromString:insertString :data];
                    }

                }
             } @catch (NSException *exception) {
                 NSLog(@"予報がありません。");
             }
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             // エラーの場合の処理
         }
     ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    images = [NSMutableDictionary dictionary];
    NSString *createSql = @"CREATE TABLE IF NOT EXISTS tr_forecast (forecast_id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT,telop TEXT, image_url TEXT); ";
    [FMDbConect createFromString:createSql];
    NSString *selectSql = @"SELECT * FROM tr_forecast";
    NSArray *columes = @[@"date",@"telop",@"image_url"];
    [self getForcasts:@"?city=130010"];
    forecasts = [FMDbConect selectFromSql:selectSql :columes];
    [_tableView reloadData];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *forecast = forecasts[indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",forecast[@"date"],forecast[@"telop"]];
    if(images[forecast[@"image_url"]] == nil){
        //非同期　画像取得
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_queue_t q_main = dispatch_get_main_queue();
        cell.imageView.image = nil;
        dispatch_async(q_global, ^{
            NSString *imageURL = forecast[@"image_url"];
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString: imageURL]]];
            dispatch_async(q_main, ^{
                cell.imageView.image = image;
                [images setObject:image forKey:forecast[@"image_url"]];
                [cell layoutSubviews];
            });
        });
    }else{
        cell.imageView.image = images[forecast[@"image_url"]];
    }
    return  cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return forecasts.count;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
