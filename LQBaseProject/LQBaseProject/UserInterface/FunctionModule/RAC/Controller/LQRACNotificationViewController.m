//
//  LQRACNotificationViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/30.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQRACNotificationViewController.h"

@interface LQRACNotificationViewController ()

@end

@implementation LQRACNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * str = @"RAC 改变字符串";
    [[NSNotificationCenter defaultCenter] postNotificationName:@"postData" object:str];
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
