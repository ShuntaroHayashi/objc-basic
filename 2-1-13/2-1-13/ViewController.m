#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *testCollectionView;
@end

@implementation ViewController
{
    NSArray *images;
}
//section数　設定
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//section内 数設定
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return [images count];
}
//cellを返す
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //    UICollectionViewCell *cell = [UICollectionViewCell init];
    UICollectionViewCell *cell;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"testCell"
                                                     forIndexPath:indexPath];
    UIImageView *imageView = [cell.contentView viewWithTag:1];
    imageView.image = [UIImage imageNamed:images[indexPath.row]];
    return cell;
}
//レイアウト設定
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
        float size = (self.testCollectionView.frame.size.width - 10) / 2;
        return CGSizeMake(size, size);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //delegate設定
    _testCollectionView.delegate = self;
    _testCollectionView.dataSource = self;
    [_testCollectionView    registerClass:[UICollectionViewCell class]
               forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])
     ];
    //表示画像名配列
    images = @[@"aomori",@"kanagawa",@"chiba",@"tokyo"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

