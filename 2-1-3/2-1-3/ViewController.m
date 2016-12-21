//
//  ViewController.m
//  2−1−3
//
//  Created by ITユーザー on 2016/12/21.
//  Copyright © 2016年 hayashi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *testButton;
@end

@implementation ViewController
- (IBAction)testButtonOnTap:(UIButton *)sender {
    //表示画像の配列
    NSArray<UIImage *> *uiImages = @[[UIImage imageNamed:@"back1"],
                                     [UIImage imageNamed:@"back2"],
                                     [UIImage imageNamed:@"back3"],
                                     [UIImage imageNamed:@"back4"],
                                     [UIImage imageNamed:@"back5"]];
    //0 ~ uiImagesの要素数の整数を作成
    int index = (int)arc4random_uniform((u_int32_t)uiImages.count);
    //背景画像の切り替え
    [_testButton setBackgroundImage:uiImages[index] forState:UIControlStateNormal];
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
