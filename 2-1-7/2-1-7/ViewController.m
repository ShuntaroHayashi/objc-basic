//
//  ViewController.m
//  2-1-7
//
//  Created by B002 on 2016/12/22.
//  Copyright © 2016年 Hayashi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *testTextField;
@property(nonatomic, strong) UITapGestureRecognizer *singleTap;
@end

@implementation ViewController
- (IBAction)testTextFieldOnTapd:(UITextField *)sender {
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // 最大入力文字数
    int maxInputLength = 30;
    
    // 入力済みのテキストを取得
    NSMutableString *str = [textField.text mutableCopy];
    
    // 入力済みのテキストと入力が行われたテキストを結合
    [str replaceCharactersInRange:range withString:string];
    
    if ([str length] > maxInputLength) {
        // ※ここに文字数制限を超えたことを通知する処理を追加
        NSLog(@"30文字を超えました。");
        return NO;
    }
    if([str length] == 0){
        
    }
    return YES;
}
-(void)onSingleTap:(UITapGestureRecognizer *)recognizer {
    [self.testTextField resignFirstResponder];
}
-(BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (gestureRecognizer == self.singleTap) {
        // キーボード表示中のみ有効
        if (self.testTextField.isFirstResponder) {
            return YES;
        } else {
            return NO;
        }
    }
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onSingleTap:)];
    self.singleTap.delegate = self;
    self.singleTap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:self.singleTap];
    _testTextField.placeholder = @"文字列を入力してください。";
    _testTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
