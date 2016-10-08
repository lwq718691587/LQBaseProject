//
//  LQGetLableHeightViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/28.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQGetLableHeightViewController.h"

@interface LQGetLableHeightViewController ()

@end

@implementation LQGetLableHeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel * lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
    lable1.text = @"你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊";
    lable1.backgroundColor = [UIColor redColor];
    lable1.numberOfLines = 0;
    [lable1 LQLabelAutoHeightWith:1];
    [self.view addSubview:lable1];
    
    
    UILabel * lable2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 200, 20)];
    lable2.text = @"你好啊";
    lable2.backgroundColor = [UIColor redColor];
    lable2.numberOfLines = 0;
    [lable2 LQLabelAutoHeightWith:1];
    [self.view addSubview:lable2];
    
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
