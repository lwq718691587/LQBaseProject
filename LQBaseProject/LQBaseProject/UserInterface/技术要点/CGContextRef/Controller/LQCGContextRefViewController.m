//
//  LQCGContextRefViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/27.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQCGContextRefViewController.h"
#import "LQCGContextReftVIew.h"
@interface LQCGContextRefViewController ()

@end

@implementation LQCGContextRefViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor whiteColor];
    LQCGContextReftVIew * view= [[LQCGContextReftVIew alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    
  
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
