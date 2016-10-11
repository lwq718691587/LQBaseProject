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

#import "LQFunctionViewController.h"
#import "LQPatternViewController.h"
#import "LQUIControlViewController.h"
@interface BaseTabBarViewController ()
@property(nonatomic,strong)NSMutableArray * btnArr;
@property(nonatomic,strong)UIImageView * bearbarImageView;
@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnArr = [[NSMutableArray alloc]init];
    [self addViewController];
    [self systemTabbar];
//    [self customTab1];
    
   
    // Do any additional setup after loading the view.
}

//装载视图 -
-(void)addViewController
{
    
    LQPatternViewController * vc1 = [[LQPatternViewController alloc]init];
    vc1.title = @"设计模式学习";
    BaseNavigationViewController * nvc1 = [[BaseNavigationViewController alloc]initWithRootViewController:vc1];
    nvc1.title = @"";
 
    
    LQUIControlViewController * vc2 = [[LQUIControlViewController alloc]init];
    vc2.title = @"控件学习";
    BaseNavigationViewController * nvc2 = [[BaseNavigationViewController alloc]initWithRootViewController:vc2];
    nvc2.title = @"";
    
    LQFunctionViewController * vc3 = [[LQFunctionViewController alloc]init];
    vc3.title = @"技术要点学习";
    BaseNavigationViewController * nvc3 = [[BaseNavigationViewController alloc]initWithRootViewController:vc3];
    nvc3.title = @"";
    self.viewControllers = @[nvc1,nvc2,nvc3];
    
}

-(void)systemTabbar{
    
    NSArray * itemImageArr = @[@"leftPage",@"homePage",@"rightPage"];
    
    for (int i = 0; i < 3; i++) {
        UITabBarItem * item = self.tabBar.items[i];
        item.image = [UIImage imageNamed:itemImageArr[i]];
        item.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0);
    }
    self.selectedIndex = 2;
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
    self.selectedIndex = 1;
    [self.btnArr[1] setSelected:YES];
}

-(void)toudown:(UIButton *)btn
{
    for (UIButton * tabBtn in self.btnArr) {
        tabBtn.selected = NO;
    }
    btn.selected = !btn.selected;
    self.selectedIndex = btn.tag;
}

#pragma mark 转屏方法重写

-(BOOL)shouldAutorotate{
    return self.selectedViewController.shouldAutorotate;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.selectedViewController supportedInterfaceOrientations];
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}



@end
