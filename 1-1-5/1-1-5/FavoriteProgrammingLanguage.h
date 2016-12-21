//
//  FavoriteProgrammingLanguage.h
//  1-1-5
//
//  Created by ITユーザー on 2016/12/20.
//  Copyright © 2016年 hayashi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteProgrammingLanguageDelegate.h"

@interface FavoriteProgrammingLanguage : NSObject
@property(nonatomic,weak)id<FavoriteProgrammingLanguageDelegate> delegate;
-(void)partake;
@end
