//
//  ViewController.m
//  SQLiteTest
//
//  Created by 林俊太朗 on 2017/01/11.
//  Copyright © 2017年 林俊太朗. All rights reserved.
//

#import "ViewController.h"
#import "FMDbConect.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
{
    NSMutableArray<NSMutableDictionary *> *todoItems;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    //既に存在しない場合table作成
    NSString *createSql = @"CREATE TABLE IF NOT EXISTS tr_todo (todo_id INTEGER PRIMARY KEY AUTOINCREMENT, todo_title TEXT,todo_contents TEXT,created DATETIME, modified DATETIME, limit_date DATETIME, delete_flag BOOL); ";
    [FMDbConect createFromString:createSql];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: self];
    //tableViewの表示内容取得
    NSString *selectSql = @"SELECT todo_id, todo_title, todo_contents, limit_date FROM tr_todo WHERE delete_flag = 0 ORDER BY limit_date;";
    NSArray *colums = @[@"todo_id",@"todo_title",@"todo_contents",@"limit_date"];
    todoItems = [FMDbConect selectFromSql:selectSql :colums];
    [_tableView reloadData];
}
//tableViewDelegate実装
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *limitDateString;
    NSMutableDictionary *todoItem = todoItems[indexPath.row];
    if (![todoItem[@"limit_date"] isEqual:[NSNull null]]) {
        //年月日だけの現在日時を取得
        NSDate *today = [formatter dateFromString:[formatter stringFromDate:[NSDate date]]];
        //limit_dateをNSDate型に直す
        long time = [todoItem[@"limit_date"] longValue];
        NSDate *limit_date = [NSDate dateWithTimeIntervalSince1970:time];
        //現在日時とlimit_dateの比較
        switch ([today compare:limit_date]) {
            case NSOrderedSame:
                limitDateString = @"today";
                break;
            case NSOrderedAscending:
                limitDateString = [formatter stringFromDate:limit_date];
                break;
            case  NSOrderedDescending:
                limitDateString = @"期限切れ";
                break;
        }
    }else{
        limitDateString = @"期限無し";
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",limitDateString ,todoItem[@"todo_title"]];
    return  cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  todoItems.count;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"削除";
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *updateSql = @"UPDATE tr_todo SET delete_flag = ? WHERE todo_id = ?";
    NSArray *values = @[@true,todoItems[indexPath.row][@"todo_id"]];
    BOOL sccessFlag = [FMDbConect updateFromString:updateSql :values];
    if(sccessFlag){
        [todoItems removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}
//tabeleViewDelegate実装完了
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
