//
//  LQSearchingViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/23.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQSearchingViewController.h"
#import <iCarousel.h>
#import "LQSexyWomanListModel.h"
#import "LQFullscreenImageViewController.h"
#import "NSObject+StareValeu.h"
@interface LQSearchingViewController ()<iCarouselDelegate,iCarouselDataSource>

@property (strong, nonatomic) iCarousel * iCarouselView;
@property (strong, nonatomic) NSMutableArray *dataArr;
@property (nonatomic) NSInteger pageNumber;
@end

@implementation LQSearchingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self update];
    
    // Do any additional setup after loading the view.
}
- (void)initUI{
    self.view.clipsToBounds = YES;
    [self.view addSubview:self.iCarouselView];
}

#pragma mark - iCarouselDelegate
- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            return YES;
        }
        case iCarouselOptionSpacing:
        {
            return  value * 1.5;
        }
        case iCarouselOptionCount:{
            return 5;
        }
        case iCarouselOptionFadeMax:
        {
            return 0.8;
        }
        case iCarouselOptionVisibleItems:{
            
            return 3;
        }
        default:
            return value;
    }
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.dataArr.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UIImageView * iv = (UIImageView *)view;
    
    if (!iv) {
        iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
        iv.clipsToBounds = YES;
        [iv setContentMode:UIViewContentModeScaleAspectFill];
    }
    iv.backgroundColor = [UIColor redColor];
    LQSexyWomanListModel * model = self.dataArr[index];
    [iv sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"zhanweitu"]];

    return iv;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    UIImageView* cell = (UIImageView*)[carousel itemViewAtIndex:index];
    LQFullscreenImageViewController * vc = [[LQFullscreenImageViewController alloc]init];
    vc.liftedImageView = cell;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)update{
    [LQSexyWomanListModel getSexyWomanListArrSuccess:^(NSMutableArray *dataArr) {
        self.dataArr = dataArr;
       [self.iCarouselView reloadData];
    } failure:^{
        
    }];
}

#pragma mark - getter setter

- (iCarousel *)iCarouselView{
    if (!_iCarouselView) {
        _iCarouselView = [[iCarousel alloc]initWithFrame:CGRectMake(0, 0 , ScreenWidth, ScreenHeight - 64)];
        _iCarouselView.scrollSpeed = 0.7;
        _iCarouselView.vertical = NO;
        _iCarouselView.decelerationRate = 1;
        _iCarouselView.type = iCarouselTypeRotary;
        _iCarouselView.pagingEnabled = YES;
        _iCarouselView.dataSource = self;
        _iCarouselView.delegate = self;
    }
    return _iCarouselView;
}



@end
