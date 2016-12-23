//
//  ViewController.m
//  2-1-9
//
//  Created by B002 on 2016/12/23.
//  Copyright © 2016年 Hayashi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIToolbar *myToolBar;
@property (weak, nonatomic) IBOutlet UIDatePicker *testDatePicker;
@end

@implementation ViewController
//DoneButton押下時
- (IBAction)doneTapd:(UIBarButtonItem *)sender {
    [self hiddenDatePicker];
}
//DatePicker表示メソッド
-(void)showDatePicker{
    _myToolBar.hidden = NO;
    _testDatePicker.hidden = NO;
    [self datePickerChanged:_testDatePicker];
}
//DatePicker非表示メソッド
-(void)hiddenDatePicker{
    _myToolBar.hidden = YES;
    _testDatePicker.hidden = YES;
}
//画面Tap時
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if(touch.view.tag == 10){
        [self showDatePicker];
    }else{
        [self hiddenDatePicker];
    }
}
//DatePickerの値が変更時に呼び出されるメソッド
-(void)datePickerChanged:(UIDatePicker*)dp{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    _myLabel.text = [formatter stringFromDate:dp.date];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //myLabel 設定
    _myLabel.userInteractionEnabled = YES;
    _myLabel.layer.borderColor = [UIColor blackColor].CGColor;
    _myLabel.layer.borderWidth = 1.0;
    //DatePicker 設定
    _testDatePicker.datePickerMode = UIDatePickerModeDate;
    _testDatePicker.date = [NSDate date];
    [_testDatePicker    addTarget:self
                        action:@selector(datePickerChanged:)
                        forControlEvents:UIControlEventValueChanged
     ];
    [self hiddenDatePicker];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
