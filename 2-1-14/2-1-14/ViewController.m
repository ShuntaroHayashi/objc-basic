//
//  ViewController.m
//  2-1-14
//
//  Created by B002 on 2016/12/30.
//  Copyright © 2016年 Hayashi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ViewController
{
    NSArray *texts;
    NSArray *images;
}
//tableview 行数設定
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return texts.count;
}
//cell 設定
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]    initWithStyle:UITableViewCellStyleDefault
                                                      reuseIdentifier:@"Cell"
                             ];
    //cell.textLabel 行数、高さ設定
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByCharWrapping;
    //cell データ設定
    cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    cell.textLabel.text = texts[indexPath.row];
    return cell;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    //プロジェクト内のファイルにアクセスできるオブジェクトを宣言
    NSBundle *bundle = [NSBundle mainBundle];
    //読み込むプロパティリストのファイルパスを指定
    NSString *path = [bundle pathForResource:@"myPlist" ofType:@"plist"];
    //プロパティリストの中身データを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    texts = [dic objectForKey:@"texts"];
    images = [dic objectForKey:@"images"];
    //cell サイズ設定
    _myTableView.estimatedRowHeight = 20;
    _myTableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
