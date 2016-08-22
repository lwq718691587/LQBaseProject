//
//  LQSexyWomanListViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQSexyWomanListViewController.h"
#import "LQSexyWomanListModel.h"
#import "LQImageListCollectionViewCell.h"
#import "LQFullscreenImageViewController.h"

#import "LQCustomCollectionViewLayout.h"
#import "LQwaterFlowLayout.h"

#define itemw  (ScreenWidth - 25)/2

@interface LQSexyWomanListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView  *imageListCollectionView;

@property (nonatomic) NSInteger pageNumber;

@property (strong, nonatomic) NSMutableArray *hArr;;

@end

@implementation LQSexyWomanListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageNumber = 1;
    self.hArr = [NSMutableArray array];
    [self.view addSubview:self.imageListCollectionView];
    [self update];

    // Do any additional setup after loading the view.
}


#pragma mark - UICollectionView DataSource and Delegate


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height = [self.hArr[indexPath.row] floatValue];
    
    return CGSizeMake(itemw, height);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LQImageListCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
//    cell.model = self.dataArr[indexPath.row];
    cell.backgroundColor = FlatOrangeDark;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    LQImageListCollectionViewCell* cell = (LQImageListCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    LQFullscreenImageViewController * vc = [[LQFullscreenImageViewController alloc]init];
    vc.liftedImageView = cell.sexyWomenImageView;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - 获取数据
-(void)update{
    [LQSexyWomanListModel getSexyWomanListArrWithPageNumber:self.pageNumber Success:^(NSMutableArray *dataArr) {
        if (self.pageNumber > 1) {
            [self.dataArr addObjectsFromArray:dataArr];
        }else{
            self.dataArr = dataArr;
        }
        [self.imageListCollectionView reloadData];
        
        for (int i = 0; i < self.dataArr.count; i++) {
            [self.hArr addObject:@(arc4random()%100 + 50)];
        }
        [self.imageListCollectionView.mj_footer endRefreshing];
        [self.imageListCollectionView.mj_header endRefreshing];
    } failure:^{
        
    }];

}
#pragma mark - setter&getter
static NSString *const identify = @"collectionViewCell";
-(UICollectionView *)imageListCollectionView{
    if (!_imageListCollectionView) {
        LQwaterFlowLayout* flowLayout = [[LQwaterFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 5;
        flowLayout.minimumInteritemSpacing = 5;
        self.imageListCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(10, 0, ScreenWidth-20, ScreenHeight) collectionViewLayout:flowLayout];
        self.imageListCollectionView.backgroundColor = [UIColor whiteColor];
        [self.imageListCollectionView registerClass:[LQImageListCollectionViewCell class] forCellWithReuseIdentifier:identify];
        self.imageListCollectionView.dataSource = self;
        self.imageListCollectionView.delegate = self;
        self.imageListCollectionView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
        self.imageListCollectionView.clipsToBounds  = YES;
        self.imageListCollectionView.backgroundColor = [UIColor redColor];
        MJRefreshNormalHeader* header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.pageNumber = 1;
            [self update];
        }];
        header.ignoredScrollViewContentInsetTop = 10;
        [header setTitle:@"下拉开始刷新" forState:MJRefreshStateIdle];
        [header setTitle:@"松开以进行刷新" forState:MJRefreshStatePulling];
        [header setTitle:@"刷新中 ..." forState:MJRefreshStateRefreshing];
        self.imageListCollectionView.mj_header = header;
        
        self.imageListCollectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            self.pageNumber++ ;
            [self update];
        }];

    }
    return _imageListCollectionView;
}


@end
