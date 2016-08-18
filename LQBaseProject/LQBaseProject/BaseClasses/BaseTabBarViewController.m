//
//  BaseTabBarViewController.m
//  LOLKit
//
//  Created by 刘伟强 on 16/8/18.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "BaseNavigationViewController.h"
#import "LQMacro.h"

@interface BaseTabBarViewController ()
@property(nonatomic,strong)NSMutableArray * btnArr;
@property(nonatomic,strong)UIImageView * bearbarImageView;
@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnArr = [[NSMutableArray alloc]init];
    [self addViewController];
    [self customTab1];
    self.selectedIndex = 1;
    [self.btnArr[1] setSelected:YES];
    // Do any additional setup after loading the view.
}

//装载视图 -
-(void)addViewController
{
    UIViewController * vc1 = [[UIViewController alloc]init];
    BaseNavigationViewController * nvc1 = [[BaseNavigationViewController alloc]initWithRootViewController:vc1];
    
    UIViewController * vc2 = [[UIViewController alloc]init];
    BaseNavigationViewController * nvc2 = [[BaseNavigationViewController alloc]initWithRootViewController:vc2];
    
    UIViewController * vc3 = [[UIViewController alloc]init];
    BaseNavigationViewController * nvc3 = [[BaseNavigationViewController alloc]initWithRootViewController:vc3];
    
    self.viewControllers = @[nvc1,nvc2,nvc3];
    
}


//自定义tab -
-(void)customTab1
{
    self.tabBar.backgroundImage = [[UIImage alloc]init];
    self.tabBar.shadowImage = [[UIImage alloc]init];
    
    self.bearbarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -17, ScreenWidth, 66)];
    self.bearbarImageView.image = [UIImage imageNamed:@"bearBack"];
    self.bearbarImageView.backgroundColor = [UIColor clearColor];
    [self.bearbarImageView setContentMode:UIViewContentModeScaleToFill];
    self.bearbarImageView.userInteractionEnabled = YES;
    [self.tabBar addSubview:self.bearbarImageView];
    
    NSArray * imageName = @[@"kouqianghuli",@"熊",@"gerenzhongxin"];
    NSArray * imageSelectName = @[@"kouqianghuliblue",@"熊眯",@"gerenzhongxinblue"];
    for (int i = 0;  i<3 ; i++) {
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth/3 * i, 24, ScreenWidth/3, 36)];
        
        if (i == 1) {
            btn.frame = CGRectMake(ScreenWidth/3 * i , 22, ScreenWidth/3, 36);
        }
        [btn setImage:[UIImage imageNamed:imageName[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imageSelectName[i]] forState:UIControlStateSelected];
        btn.tag = i;
        [btn addTarget:self action:@selector(toudown:) forControlEvents:UIControlEventTouchDown];
        [self.bearbarImageView addSubview:btn];
        [self.btnArr addObject:btn];
    }
    
}

-(void)toudown:(UIButton *)btn
{
    for (UIButton * tabBtn in self.btnArr) {
        tabBtn.selected = NO;
    }
    btn.selected = !btn.selected;
    self.selectedIndex = btn.tag;
}

@end
