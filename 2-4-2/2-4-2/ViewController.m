//
//  ViewController.m
//  2-4-2
//
//  Created by 林俊太朗 on 2017/01/26.
//  Copyright © 2017年 林俊太朗. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
NSString *const base_url = @"http://weather.livedoor.com/forecast/webservice/json/v1";
@interface ViewController ()
@end

@implementation ViewController
- (IBAction)showButtonTapd:(id)sender {
    [self showAlertController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
-(void)showAlertController{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"天気予報"
                                                                             message:@"日付を選択してください"
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"今日"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
        [self buttonTapd:0];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"明日"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
        [self buttonTapd:1];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"明後日"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
        [self buttonTapd:2];
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
-(void)viewDidAppear:(BOOL)animated{
    [self showAlertController];
    
}
-(void)buttonTapd:(NSInteger)index{
    NSString *cityCode = @"?city=130010";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:[base_url stringByAppendingString:cityCode] parameters:nil progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
             // json取得に成功した場合の処理
             @try {
                 NSArray *forecasts = responseObject[@"forecasts"];
                 NSDictionary *forecast = forecasts[index];
                 NSLog(@"%@ %@",forecast[@"dateLabel"],forecast[@"telop"]);
             } @catch (NSException *exception) {
                 NSLog(@"予報がありません。");
             }
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             // エラーの場合の処理
         }
     ];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
