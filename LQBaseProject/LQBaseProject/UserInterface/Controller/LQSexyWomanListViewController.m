//
//  LQSexyWomanListViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQSexyWomanListViewController.h"
#import "LQSexyWomanListModel.h"
#import "LQImageLIstCollectionViewCell.h"

@interface LQSexyWomanListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView  *imageListCollectionView;
@property (strong, nonatomic) NSMutableArray *dataArr;

@end

@implementation LQSexyWomanListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.imageListCollectionView];
    [self update];

    // Do any additional setup after loading the view.
}


#pragma mark - UICollectionView DataSource and Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LQImageLIstCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.model = self.dataArr[indexPath.row];
    
    cell.backgroundColor = FlatOrangeDark;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - 获取数据
-(void)update{
    [LQSexyWomanListModel getSexyWomanListArrWithPageNumber:1 Success:^(NSMutableArray *dataArr) {
        
        self.dataArr = dataArr;
        [self.imageListCollectionView reloadData];
    } failure:^{
        
    }];

}
#pragma mark - setter&getter
static NSString *const identify = @"collectionViewCell";
-(UICollectionView *)imageListCollectionView{
    if (!_imageListCollectionView) {
        UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake((ScreenWidth - 10)/2, (ScreenWidth - 10)/2 * 1.4);
        flowLayout.minimumInteritemSpacing = 1;
        flowLayout.minimumLineSpacing = 1;
        self.imageListCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:flowLayout];
        self.imageListCollectionView.backgroundColor = [UIColor whiteColor];
        [self.imageListCollectionView registerClass:[LQImageLIstCollectionViewCell class] forCellWithReuseIdentifier:identify];
        self.imageListCollectionView.dataSource = self;
        self.imageListCollectionView.delegate = self;
    }
    return _imageListCollectionView;
}

@end
