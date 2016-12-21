//
//  FavoriteProgrammingLanguage.m
//  1-1-5
//
//  Created by ITユーザー on 2016/12/20.
//  Copyright © 2016年 hayashi. All rights reserved.
//

#import "FavoriteProgrammingLanguage.h"

@implementation FavoriteProgrammingLanguage : NSObject
-(void)partake{
    NSLog(@"インターンに参加しました。");
    if([self.delegate respondsToSelector:@selector(canDoObjectiveC)]){
        [self.delegate canDoObjectiveC];
    }
}
@end
