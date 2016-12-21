//
//  ViewController.m
//  2-1-6
//
//  Created by ITユーザー on 2016/12/21.
//  Copyright © 2016年 hayashi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *testWebView;

@end

@implementation ViewController
- (IBAction)goBackOntapd:(UIBarButtonItem *)sender {
    [_testWebView goBack];
}
- (IBAction)goForwardOnTapd:(UIBarButtonItem *)sender {
    [_testWebView goForward];
}
- (IBAction)reloadOnTapd:(UIBarButtonItem *)sender {
    [_testWebView reload];
}
//UIWebView がエラーをはいた場合の処理
- (void)webView:(UIWebView*)view didFailLoadWithError:(NSError*)error {
    NSLog(@"error");
    // キャンセルボタン押下時以外
    if([error code] != NSURLErrorCancelled) {
        //アラート表示処理
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                                 message:@"ウェブページが取得できませんでした。"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        //OKボタン作成
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              //OKボタン押下時の処理
                                                              NSLog(@"OK Button tapd");
                                                          }]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL URLWithString:@"http://www.yahoo.co.jp"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_testWebView loadRequest:request];
    _testWebView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
