//
//  Account.m
//  1-1-4
//
//  Created by ITユーザー on 2016/12/20.
//  Copyright © 2016年 hayashi. All rights reserved.
//

#import "Account.h"

@implementation Account
//イニシャライザー
-(id) initWithName:(NSString *)name :(NSInteger)age :(NSString *)gender :(NSString *)language{
    if(self = [super init]){
        self.name = name;
        self.age = age;
        self.gender = gender;
        self.language = language;
    }
    return self;
}
//NSLogに自信の情報を表示
-(void)printInformation{
    if([self.gender  isEqual: @"男性"]){
        NSLog(@"「%@君は、%@が得意な%zd歳です。」",self.name,self.language,self.age);
    }else if([self.gender isEqual:@"女性"]) {
        NSLog(@"「%@さんは、%@が得意な%zd歳です。」",self.name,self.language,self.age);
    }
}
@end
