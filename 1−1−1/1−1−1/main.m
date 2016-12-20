//
//  main.m
//  1-1-1
//
//  Created by ITユーザー on 2016/12/20.
//  Copyright © 2016年 hayashi. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //変数作成
        BOOL boolTest = YES;
        NSString *stringTest = @"hello";
        NSInteger integerTest = 100;
        NSNumber *numberTest = [NSNumber numberWithDouble:3.141592];
        //変数出力
        NSLog(@"BOOL:%hhd",boolTest);
        NSLog(@"NSString:%@",stringTest);
        NSLog(@"NSInteger%zd",integerTest);
        NSLog(@"NSNumber:%@",numberTest);
    }
    return 0;
}
