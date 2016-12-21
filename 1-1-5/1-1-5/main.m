//
//  main.m
//  1-1-5
//
//  Created by ITユーザー on 2016/12/20.
//  Copyright © 2016年 hayashi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Account *account = [[Account alloc]initWithName:@"林" :21 :@"男性" :@"swift" ];
        [account printInformation];
    }
    return 0;
}
