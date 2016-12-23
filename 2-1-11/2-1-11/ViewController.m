//
//  ViewController.m
//  2-1-11
//
//  Created by B002 on 2016/12/23.
//  Copyright © 2016年 Hayashi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *testTableView;

@end

@implementation ViewController
{
    NSDictionary *kanto;
    NSDictionary *tohoku;
    NSDictionary *region;
}
//section数設定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [region count];
}
//section title設定
- (NSString *)  tableView:(UITableView *)tableView
                titleForHeaderInSection:(NSInteger)section{
    return region.allKeys[section];
}
//tableview 行数設
-(NSInteger)tableView:(UITableView *)tableView
            numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [tohoku[@"texts"] count];
            break;
        case 1:
            return [kanto[@"texts"] count];
            break;
        default:
            return  0;
            break;
    }
}
//cell 設定
-(UITableViewCell *)tableView:(UITableView *)tableView
                    cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]
                             initWithStyle:UITableViewCellStyleDefault
                             reuseIdentifier:@"Cell"
                            ];
    //cell.textLabel 行数、高さ設定
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByCharWrapping;
    //cell データ設定
    NSString *str;
    UIImage *image;
    switch (indexPath.section) {
        case 0:
            str = tohoku[@"texts"][indexPath.row];
            image = [UIImage imageNamed: tohoku[@"images"][indexPath.row]];
            break;
        case 1:
            str = kanto[@"texts"][indexPath.row];
            image = [UIImage imageNamed: kanto[@"images"][indexPath.row]];
            break;
        default:
            break;
    }
    cell.imageView.image = image;
    cell.textLabel.text = str;
    return cell;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _testTableView.delegate = self;
    _testTableView.dataSource = self;
    //プロジェクト内のファイルにアクセスできるオブジェクトを宣言
    NSBundle *bundle = [NSBundle mainBundle];
    //読み込むプロパティリストのファイルパスを指定
    NSString *path = [bundle pathForResource:@"myPlist" ofType:@"plist"];
    //プロパティリストの中身データを取得
    region = [NSDictionary dictionaryWithContentsOfFile:path];
    kanto = region[@"関東"];
    tohoku = region[@"東北"];
    //cell サイズ設定
    self.testTableView.estimatedRowHeight = 20;
    self.testTableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
