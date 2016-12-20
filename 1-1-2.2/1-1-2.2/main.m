//
//  main.m
//  1-1-2
//
//  Created by ITユーザー on 2016/12/20.
//  Copyright © 2016年 hayashi. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //変数作成
        NSArray *arrayTest = @[@"今田",@"三木",@"青木"];
        NSDictionary *dictionaryTest = @{@"1104":@"中村",
                                         @"1105":@"林",
                                         @"1106":@"福本"
                                         };
        //変数出力
        NSLog(@"%@",arrayTest[0]);
        NSLog(@"%@",dictionaryTest[@"1104"]);
    }
    return 0;
}
