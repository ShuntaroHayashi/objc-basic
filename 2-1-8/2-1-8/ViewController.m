//
//  ViewController.m
//  2-1-8
//
//  Created by B002 on 2016/12/22.
//  Copyright © 2016年 Hayashi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (weak, nonatomic) IBOutlet UIPickerView *testPicker;
@end

@implementation ViewController
{
    NSArray* dataArray;
}
-(void)showPiker{
    _testPicker.hidden = NO;
    _toolBar.hidden = NO;
}
-(void)hiddenPicker{
    _testPicker.hidden = YES;
    _toolBar.hidden = YES;
}
- (IBAction)doneTapd:(UIBarButtonItem *)sender {
    [self hiddenPicker];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // pickerdelegateの設定
    _testPicker.delegate = self;
    [self hiddenPicker];
    //カテゴリを配列に
    dataArray = @[@"1行目",@"2行目",@"3行目",@"4行目",@"5行目"];
    _myLabel.userInteractionEnabled = YES;
    _myLabel.layer.borderColor = [UIColor blackColor].CGColor;
    _myLabel.layer.borderWidth = 1.0;
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if(touch.view.tag == 10){
        [self showPiker];
    }else{
        [self hiddenPicker];
    }
}
// ピッカービューのコンポーネント（行）の数を返す *必須
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// 行数を返す例　*必須
- (NSInteger) pickerView: (UIPickerView*)pView numberOfRowsInComponent:(NSInteger) component {
    return [dataArray count];
}

// ピッカービューの行のタイトルを返す
- (NSString*)pickerView: (UIPickerView*) pView titleForRow:(NSInteger) row forComponent:(NSInteger)componet
{
    //n行目に配列のn番目の要素を設定
    return dataArray[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _myLabel.text = dataArray[row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
