//
//  Account.h
//  1-1-5
//
//  Created by ITユーザー on 2016/12/20.
//  Copyright © 2016年 hayashi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteProgrammingLanguage.h"
#import "FavoriteProgrammingLanguageDelegate.h"

@interface Account : NSObject <FavoriteProgrammingLanguageDelegate>{
    FavoriteProgrammingLanguage *favProLanguage;
}
//プロパティー
@property(nonatomic,copy) NSString *name;
@property(nonatomic) NSInteger age;
@property(nonatomic,copy) NSString *gender;
@property(nonatomic,copy) NSString *language;
//イニシャライザー
-(id)initWithName :(NSString*)name :(NSInteger)age :(NSString*)gender :(NSString*)language;
//NSLogに自信の情報を表示
-(void)printInformation;
@end
