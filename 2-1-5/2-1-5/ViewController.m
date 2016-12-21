//
//  ViewController.m
//  2-1-5
//
//  Created by ITユーザー on 2016/12/21.
//  Copyright © 2016年 hayashi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)alertTestOnTapd:(UIButton *)sender {
    //UIAlertController 作成
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert Test"
                                                                             message:@"Alert Test Button tapd"
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    //Facebookボタン作成
    [alertController addAction:[UIAlertAction actionWithTitle:@"Facebook"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          //Facebookボタン押下時の処理
                                                          NSLog(@"Facebook Button tapd");
                                                      }]];
    //Twitterボタン作成
    [alertController addAction:[UIAlertAction actionWithTitle:@"Twitter"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          //Twitterボタン押下時の処理
                                                          NSLog(@"Twitter Button tapd");
                                                          
                                                      }]];
    //Lineボタン作成
    [alertController addAction:[UIAlertAction actionWithTitle:@"Line"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          //Lineボタン押下時の処理
                                                          NSLog(@"Line Button tapd");
                                                          
                                                      }]];
    
    [self presentViewController:alertController animated:YES completion:nil];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
