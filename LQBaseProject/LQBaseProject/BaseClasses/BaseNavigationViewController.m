//
//  BaseNavigationViewController.m
//  LOLKit
//
//  Created by 刘伟强 on 16/8/18.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"导航栏渐变_02"]];
//    self.navigationBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"导航栏渐变_02"]];
//    self.navigationBar.tintColor = AppColor;
//    self.navigationBar.titleTextAttributes =@{NSForegroundColorAttributeName:HexColor(@"303a48"),NSFontAttributeName:[UIFont fontWithName:AppFontName size:NavigationTitleFontSize]};
//    //去掉导航栏下的黑线
//    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    self.navigationBar.shadowImage = [[UIImage alloc] init];
//    self.navigationBar.translucent  = NO;
//    
//    __weak typeof (self) weakSelf = self;
//    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.interactivePopGestureRecognizer.delegate = weakSelf;
//    }

    
    // Do any additional setup after loading the view.
}

#pragma mark 转屏方法重写
- (BOOL)shouldAutorotate{
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}



@end
