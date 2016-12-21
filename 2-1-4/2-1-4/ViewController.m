//
//  ViewController.m
//  2-1-4
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
                                                          preferredStyle:UIAlertControllerStyleAlert];
    //OKボタン作成
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          //OKボタン押下時の処理
                                                          NSLog(@"OK Button tapd");
                                                      }]];
    //Cancelボタン作成
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          //Cancelボタンが押下時の処理
                                                          NSLog(@"Cancel Button tapd");

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
