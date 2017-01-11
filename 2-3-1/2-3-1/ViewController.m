//
//  ViewController.m
//  2-3-1
//
//  Created by 林俊太朗 on 2017/01/07.
//  Copyright © 2017年 林俊太朗. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *intField;
@property (weak, nonatomic) IBOutlet UITextField *doubleField;
@property (weak, nonatomic) IBOutlet UITextField *stringField;
@end

@implementation ViewController
- (IBAction)saveOnTap:(id)sender {
    // NSUserDefaultsに値を登録する
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setInteger:[_intField.text integerValue] forKey:@"int"];
    [ud setDouble:[_doubleField.text doubleValue] forKey:@"double"];
    [ud setObject:_stringField.text forKey:@"string"];
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
