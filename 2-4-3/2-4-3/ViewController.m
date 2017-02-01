//
//  ViewController.m
//  2-4-3
//
//  Created by 林俊太朗 on 2017/01/26.
//  Copyright © 2017年 林俊太朗. All rights reserved.
//

#import "ViewController.h"

#import "AFNetworking.h"
NSString *const base_url = @"http://weather.livedoor.com/forecast/webservice/json/v1";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ViewController
{
    NSArray *forecasts;
    NSDictionary *description;
}
- (void)getForcasts:(NSString *)cityCode{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:[base_url stringByAppendingString:cityCode] parameters:nil progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
             // json取得に成功した場合の処理
             @try {
                 forecasts = responseObject[@"forecasts"];
                 [_tableView reloadData];
                 description = responseObject[@"description"];
                 _textLabel.text = description[@"text"];
                 
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
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self getForcasts:@"?city=130010"];
    
}

//以下tableViewDelegate実装 -----
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return forecasts.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *tbCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    NSDictionary *forecast = forecasts[indexPath.row];
    tbCell.textLabel.text = [NSString stringWithFormat:@"%@(%@) %@",forecast[@"dateLabel"],forecast[@"date"],forecast[@"telop"]];
    //非同期　画像取得
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t q_main = dispatch_get_main_queue();
    tbCell.imageView.image = nil;
    dispatch_async(q_global, ^{
        NSString *imageURL = forecast[@"image"][@"url" ];
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString: imageURL]]];
        dispatch_async(q_main, ^{
            tbCell.imageView.image = image;
            [tbCell layoutSubviews];
        });
    });
    return tbCell;
}
//tableViewDelegate実装完了
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
