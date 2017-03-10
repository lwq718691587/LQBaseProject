//
//  LQCoreTextViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2017/3/10.
//  Copyright © 2017年 刘伟强. All rights reserved.
//

#import "LQCoreTextViewController.h"
#import "LQCoreTextView.h"
@interface LQCoreTextViewController ()

@end

@implementation LQCoreTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LQCoreTextView * v = [[LQCoreTextView alloc]initWithFrame:CGRectMake(0, 20, ScreenWidth, ScreenWidth)];
    v.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:v];
    
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
