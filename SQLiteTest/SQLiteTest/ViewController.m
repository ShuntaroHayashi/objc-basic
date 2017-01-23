//
//  ViewController.m
//  SQLiteTest
//
//  Created by 林俊太朗 on 2017/01/11.
//  Copyright © 2017年 林俊太朗. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    // パスとDBファイル名を指定
    NSArray  *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    NSString *db_path  = [dir stringByAppendingPathComponent:@"tr_todo.db"];
    FMDatabase *db = [FMDatabase databaseWithPath:db_path];
    // テーブルを作成
    NSString *sql = @"CREATE TABLE IF NOT EXISTS tr_todo (todo_id INTEGER PRIMARY KEY AUTOINCREMENT, todo_title TEXT ,todo_contents TEXT,created DATETIME, modified DATETIME, limit_date DATETIME, delete_flag BOOL); ";
    [db open];
    // SQLを実行
    [db executeUpdate:sql];
    [db close];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
