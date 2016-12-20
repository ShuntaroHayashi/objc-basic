//
//  main.m
//  1-1-4
//
//  Created by ITユーザー on 2016/12/20.
//  Copyright © 2016年 hayashi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //変数作成
        NSArray<Account *> *accounts = @[[[Account alloc]initWithName:@"今田" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"中村" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"林" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"福本" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"本間" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"月岡" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"宮島" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"佐藤" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"望月" :21 :@"女性" :@"日本語"],
                                         [[Account alloc]initWithName:@"高島" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"松本" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"吉田" :21 :@"男性" :@"ロシア語"],
                                         [[Account alloc]initWithName:@"毎澤" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"渡辺" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"山崎" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"佐野" :21 :@"女性" :@"日本語"],
                                         [[Account alloc]initWithName:@"冨樫" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"多田" :21 :@"女性" :@"日本語"],
                                         [[Account alloc]initWithName:@"小関" :21 :@"女性" :@"日本語"],
                                         [[Account alloc]initWithName:@"山室" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"大平" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"佐藤" :21 :@"男性" :@"日本語"],
                                         [[Account alloc]initWithName:@"藤井" :21 :@"男性" :@"日本語"]
                                         ];
        for(Account *account in accounts){
            [account printInformation];
        }
    }
    return 0;
}
