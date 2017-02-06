//
//  LQFullViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/24.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQFullViewController.h"

@interface LQFullViewController ()

@end

@implementation LQFullViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemFun)];
    
    
    [self.view addSubview:self.mp.view];
    
   

    // Do any additional setup after loading the view.
}
- (void)leftBarButtonItemFun{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden{
    return NO;
}

- (BOOL)shouldAutorotate{
    return NO;
}
//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}
@end
