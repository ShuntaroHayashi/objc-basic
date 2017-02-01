//
//  FMDbConect.h
//  SQLiteTest
//
//  Created by 林俊太朗 on 2017/01/24.
//  Copyright © 2017年 林俊太朗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMdatabase.h"

@interface FMDbConect : NSObject
+(void)initialize;
+(NSMutableArray<NSMutableDictionary *> *)selectFromSql:(NSString*)sql :(NSArray<NSString*>*)columNames;
+(void)createFromString:(NSString*)sql;
+(BOOL)insertFromString:(NSString*)sql :(NSArray*)values;
+(BOOL)updateFromString:(NSString *)sql :(NSArray*)values;
@end
