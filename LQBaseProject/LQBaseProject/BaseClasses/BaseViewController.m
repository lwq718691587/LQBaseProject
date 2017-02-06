//
//  BaseViewController.m
//  LOLKit
//
//  Created by 刘伟强 on 16/8/18.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseViewController.h"
#import <UMMobClick/MobClick.h>
@interface BaseViewController ()

@end

@implementation BaseViewController


#pragma mark - view lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]){
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:NSStringFromClass([self class])];
}
- (void)viewWillDisappear:(BOOL)animated{
    [MobClick endLogPageView:NSStringFromClass([self class])];
}

- (void)initData{}
- (void)update{}
- (void)initUI{}
- (void)initNavigation{}

- (BOOL)shouldAutorotate{
    return NO;
}
//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
