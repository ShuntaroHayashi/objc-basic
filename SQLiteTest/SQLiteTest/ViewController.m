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
    NSMutableArray<NSMutableArray *> *todoItems;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    
    NSString *createSql = @"CREATE TABLE IF NOT EXISTS tr_todo (todo_id INTEGER PRIMARY KEY AUTOINCREMENT, todo_title TEXT,todo_contents TEXT,created DATETIME, modified DATETIME, limit_date DATETIME, delete_flag BOOL); ";
    [FMDbConect createFromString:createSql];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: self];
    todoItems = [FMDbConect selectFromSql:@"SELECT todo_title,todo_contents,created,modified, limit_date,delete_flag FROM tr_todo ORDER BY limit_date;"];
    NSMutableArray *removeObjects;
    for (NSMutableArray *todoItem in todoItems) {
        if(todoItem[(todoItem.count - 1)] != [NSNumber numberWithBool:true]){
//            [todoItems removeObject:todoItem];
            [removeObjects addObject:todoItem];
        }
    }
    for(NSMutableArray *removeObject in removeObjects){
        [todoItems removeObject:removeObject];
    }
    [_tableView reloadData];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *str;
    NSMutableArray *todoItem = todoItems[indexPath.row];
    if(todoItem.count == 6){
        long time = [todoItem[4] longValue];
        NSDate *limit_date = [NSDate dateWithTimeIntervalSince1970:time];
//        if([[NSDate date] compare:limit_date]
//            NSOrderedDescending){
//            str = [NSString stringWithFormat:@"%@ %@",[formatter stringFromDate:limit_date],todoItem[0]];
//        }else{
//            str = [NSString stringWithFormat:@"期限切れ　%@",todoItem[0]];
//        }
        switch ([[NSDate date] compare:limit_date]) {
            case NSOrderedSame:
                str = [NSString stringWithFormat:@"%@ %@",[formatter stringFromDate:limit_date],todoItem[0]];
                break;
            case NSOrderedAscending:
                str = [NSString stringWithFormat:@"%@ %@",[formatter stringFromDate:limit_date],todoItem[0]];
                break;
            case  NSOrderedDescending:
                str = [NSString stringWithFormat:@"期限切れ　%@",todoItem[0]];
                break;
                
            default:
                break;
        }
    }else{
        str = [NSString stringWithFormat:@"期限無し　%@",todoItem[0]];
    }
//    NSString *limit_date = [formatter stringFromDate:todoItems[indexPath.row][4]];
    cell.textLabel.text = str;
    return  cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  todoItems.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
