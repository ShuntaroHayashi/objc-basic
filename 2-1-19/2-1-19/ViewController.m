//
//  ViewController.m
//  2-1-19
//
//  Created by 林俊太朗 on 2017/01/07.
//  Copyright © 2017年 林俊太朗. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@end

@implementation ViewController
- (IBAction)onTapd:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    appDelegate.globalString =  self.myTextField.text;
    
     [self.myTextField resignFirstResponder];
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
