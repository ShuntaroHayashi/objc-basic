//
//  main.m
//  1-1-3
//
//  Created by ITユーザー on 2016/12/20.
//  Copyright © 2016年 hayashi. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //変数作成
        NSInteger score = 80;
        NSArray *students = @[@"今田",@"三木",@"青木"];
        BOOL genderFlag = YES;//YES=男 / NO=女
        //if文
        if(score == 100){
            NSLog(@"満点です。");
        }
        //if~else文
        if(score <60){
            NSLog(@"赤点です。");
        }else{
            NSLog(@"合格です。");
        }
        //if~else if文
        if(score >= 80){
            NSLog(@"A評価です");
        }else if(score >=60){
            NSLog(@"B評価です。");
        }else{
            NSLog(@"C評価です。");
        }
        //三項演算子
        NSLog(@"今回のテストは　%@　です", score < 60 ? @"赤点":@"合格");
        //for文
        for(int i =0 ;i<5;i++){
            NSLog(@"%zd回目の処理です",i+1);
        }
        //高速列挙構文
        for(NSString *student in students){
            NSLog(@"%@",student);
        }
        //swithc文
        switch(genderFlag){
        case YES:
                NSLog(@"男性です。");
                break;
        case NO:
                NSLog(@"女性です。");
                break;
            
        default:
                break;
        }
        
    }
    return 0;
}
