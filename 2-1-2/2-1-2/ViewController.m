//
//  ViewController.m
//  2-1-2
//
//  Created by ITユーザー on 2016/12/21.
//  Copyright © 2016年 hayashi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *testImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _testImageView.contentMode = UIViewContentModeScaleAspectFit;
    _testImageView.clipsToBounds = YES;
    _testImageView.layer.cornerRadius = 10.0;
    _testImageView.image = [UIImage imageNamed:@"apple"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
