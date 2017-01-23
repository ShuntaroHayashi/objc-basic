//
//  registerViewController.m
//  SQLiteTest
//
//  Created by 林俊太朗 on 2017/01/11.
//  Copyright © 2017年 林俊太朗. All rights reserved.
//

#import "registerViewController.h"
#import "FMDatabase.h"

@interface registerViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *contentsField;
@property (weak, nonatomic) IBOutlet UITextField *limitDateField;
@end

@implementation registerViewController
{
    NSDateFormatter *formatter;
    UIDatePicker* datePicker;
}
- (IBAction)screenTap:(id)sender {
    [_titleField resignFirstResponder];
    [_contentsField resignFirstResponder];
    [_limitDateField resignFirstResponder];
}

- (IBAction)registerOnTap:(id)sender {
    _errorLabel.text = @"";
    if(![_titleField.text  isEqualToString: @""]){
        // パスとDBファイル名を指定
        NSArray  *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *dir = [paths objectAtIndex:0];
        NSString *db_path  = [dir stringByAppendingPathComponent:@"tr_todo.db"];
        FMDatabase *db = [FMDatabase databaseWithPath:db_path];
        
        NSString *insertSql =  @"INSERT INTO tr_todo (todo_title ,todo_contents ,created , modified , limit_date , delete_flag ) VALUES(?,?,?,?,?,?)";
        [db open];
        // SQLを実行
        BOOL sccessFlag = [db executeUpdate:insertSql,
            _titleField.text,_contentsField.text,
            [NSDate date],[NSDate date],
            [formatter dateFromString:_limitDateField.text],
            [NSNumber numberWithBool:false]
         ];
        [db close];
        if(sccessFlag){
            _errorLabel.textColor = [UIColor blackColor];
            _errorLabel.text = @"登録に成功しました";
        }else{
            _errorLabel.textColor = [UIColor redColor];
            _errorLabel.text = @"登録に失敗しました";
        }
    }else{
        _errorLabel.textColor = [UIColor redColor];
        _errorLabel.text = @"titleを入力してください";
    }
}
- (IBAction)doneOnTap:(id)sender {
    _limitDateField.text = [formatter stringFromDate:datePicker.date];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    // DatePickerの設定
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    
    // DatePickerを編集したら、updateTextFieldを呼び出す
    [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    
    // textFieldの入力をdatePickerに設定
    _limitDateField.inputView = datePicker;
    
    // Delegationの設定
    _limitDateField.delegate = self;
    
    // DoneボタンとそのViewの作成
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    keyboardDoneButtonView.barStyle  = UIBarStyleBlack;
    keyboardDoneButtonView.translucent = YES;
    keyboardDoneButtonView.tintColor = nil;
    [keyboardDoneButtonView sizeToFit];
    
    // 完了ボタンとSpacerの配置
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完了" style:UIBarButtonItemStylePlain target:nil action:@selector(pickerDoneClicked)];
    UIBarButtonItem *spacer1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:spacer, spacer1, doneButton, nil]];
    
    // Viewの配置
    _limitDateField.inputAccessoryView = keyboardDoneButtonView;
    
    [self.view addSubview:_limitDateField];
}
//pragma mark DatePickerの編集が完了したら結果をTextFieldに表示
-(void)updateTextField:(id)sender {
    UIDatePicker *picker = (UIDatePicker *)sender;
    _limitDateField.text = [NSString stringWithFormat:@"%@", [formatter stringFromDate:picker.date]];
}
//pragma mark datepickerの完了ボタンが押された場合
-(void)pickerDoneClicked {
    [_limitDateField resignFirstResponder];
    _limitDateField.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
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
