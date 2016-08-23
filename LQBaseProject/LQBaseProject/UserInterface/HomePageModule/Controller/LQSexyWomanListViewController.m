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




@interface LQSexyWomanListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView  *imageListCollectionView;

@property (nonatomic) NSInteger pageNumber;


@end

@implementation LQSexyWomanListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageNumber = 1;
    [self.view addSubview:self.imageListCollectionView];
    [self update];

    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - UICollectionView DataSource and Delegate


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LQImageListCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.model = self.dataArr[indexPath.row];
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
        
        [self.imageListCollectionView.mj_footer endRefreshing];
        [self.imageListCollectionView.mj_header endRefreshing];
    } failure:^{
        
    }];

}

#pragma mark - setter&getter
static NSString *const identify = @"collectionViewCell";
-(UICollectionView *)imageListCollectionView{
    if (!_imageListCollectionView) {
        LQCustomCollectionViewLayout* flowLayout = [[LQCustomCollectionViewLayout alloc]init];
      
        self.imageListCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(10, 20, ScreenWidth-20, ScreenHeight-20-TabBarHeight) collectionViewLayout:flowLayout];
        self.imageListCollectionView.backgroundColor = [UIColor whiteColor];
        [self.imageListCollectionView registerClass:[LQImageListCollectionViewCell class] forCellWithReuseIdentifier:identify];
        self.imageListCollectionView.dataSource = self;
        self.imageListCollectionView.delegate = self;
        self.imageListCollectionView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
        self.imageListCollectionView.clipsToBounds  = YES;
        self.imageListCollectionView.backgroundColor = [UIColor whiteColor];
        self.imageListCollectionView.showsVerticalScrollIndicator = NO;
        MJRefreshNormalHeader* header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.pageNumber = 1;
            [self update];
        }];
        [header setTitle:@"下拉开始刷新" forState:MJRefreshStateIdle];
        [header setTitle:@"松开以进行刷新" forState:MJRefreshStatePulling];
        [header setTitle:@"刷新中 ..." forState:MJRefreshStateRefreshing];
        header.ignoredScrollViewContentInsetTop = 10;
        self.imageListCollectionView.mj_header = header;
        
        self.imageListCollectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            self.pageNumber++ ;
            [self update];
        }];
    }
    return _imageListCollectionView;
}


@end
