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


@interface LQSexyWomanListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIActionSheetDelegate>

@property (strong, nonatomic) UICollectionView  *imageListCollectionView;
@property (copy, nonatomic) NSString *type;
@property (nonatomic) NSInteger pageNumber;


@end

@implementation LQSexyWomanListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initNavigation];
    [self initUI];
    [self update];
    
}

- (void)initData{
    self.pageNumber = 1;
    self.type = @"cosplay";
}
- (void)initNavigation{
    self.title = @"cosplay";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"清除缓存" style:UIBarButtonItemStylePlain target:self action:@selector(clearImageCache)];
}
- (void)initUI{
    [self.view addSubview:self.imageListCollectionView];
    
    UIButton * settingTypeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, ScreenHeight-NavigationBarHeight-TabBarHeight, ScreenWidth, TabBarHeight)];
    [settingTypeBtn addTarget:self action:@selector(selectType) forControlEvents:UIControlEventTouchDown];
    [settingTypeBtn setTitle:@"设置类型" forState:UIControlStateNormal];
    [settingTypeBtn setTitleColor:[UIColor flatBlueColor] forState:UIControlStateNormal];
    [settingTypeBtn setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:settingTypeBtn];

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

#pragma mark - 点击事件

- (void)clearImageCache{
    [SVProgressHUD show];
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        [SVProgressHUD dismiss];
    }];
}
- (void)selectType{
    UIActionSheet * actionSheet = [[UIActionSheet alloc]initWithTitle:@"类别" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"诱惑",@"小清新",@"西洋美人",@"网络美女",@"宅男女神",@"古典美女",@"嫩萝莉",@"气质",@"写真",@"长腿",@"cosplay", nil];
    [actionSheet showInView:self.view];
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

    self.type = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([self.type isEqualToString:@"取消"]) {
        return;
    }
    self.title = self.type;
    self.navigationController.title = @"";
    self.pageNumber = 1;
    [self update];
}

#pragma mark - 获取数据
- (void)update{
    [LQSexyWomanListModel getSexyWomanListArrWithPageNumber:self.pageNumber andType:self.type Success:^(NSMutableArray *dataArr) {
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
- (UICollectionView *)imageListCollectionView{
    if (!_imageListCollectionView) {
        LQCustomCollectionViewLayout* flowLayout = [[LQCustomCollectionViewLayout alloc]init];
      
        self.imageListCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(10,0, ScreenWidth-20, ScreenHeight-TabBarHeight-NavigationBarHeight) collectionViewLayout:flowLayout];
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
