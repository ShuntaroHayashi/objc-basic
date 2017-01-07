//
//  secondViewController.m
//  2-1-19
//
//  Created by 林俊太朗 on 2017/01/07.
//  Copyright © 2017年 林俊太朗. All rights reserved.
//

#import "secondViewController.h"
#import "AppDelegate.h"

@interface secondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    _myLabel.text = appDelegate.globalString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
