//
//  FMDbConect.m
//  SQLiteTest
//
//  Created by 林俊太朗 on 2017/01/24.
//  Copyright © 2017年 林俊太朗. All rights reserved.
//

#import "FMDbConect.h"

static FMDatabase *database;
@implementation FMDbConect
+(void)initialize{
    NSArray  *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    NSString *db_path  = [dir stringByAppendingPathComponent:@"tr_todo.db"];
    NSLog(@"%@",db_path);
    database = [FMDatabase databaseWithPath:db_path];
}
+(NSMutableArray<NSMutableArray *> *)selectFromSql:(NSString *)sql{
    NSMutableArray<NSMutableArray *> *results = [NSMutableArray array];
    [database open];
    FMResultSet *sqlResults = [database executeQuery:sql];
    while( [sqlResults next] ) {
        NSMutableArray *result = [NSMutableArray array];
        int index = 0;
        while (![[sqlResults objectForColumnIndex:index] isEqual:[NSNull null]]) {
            [result addObject:[sqlResults objectForColumnIndex:index]];
            index++;
        }
        
        [results addObject:result];
    }
    [sqlResults close];
    [database close];
    return results;
}
+(void)createFromString:(NSString *)sql{
    [database open];
    [database executeUpdate:sql];
    [database close];
}
+(BOOL)insertFromString:(NSString *)sql : (NSArray*)values{
    BOOL sccessFlag = false;
    [database open];
    sccessFlag = [database executeUpdate:sql withArgumentsInArray:values];
    [database close];
    return  sccessFlag;
}
@end
