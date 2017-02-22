//
//  LQDrawViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2017/2/20.
//  Copyright © 2017年 刘伟强. All rights reserved.
//

#import "LQDrawViewController.h"
#import "LQDrawView.h"
@interface LQDrawViewController ()




@end

@implementation LQDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LQDrawView * dview = [[LQDrawView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    dview.backgroundColor = [UIColor redColor];
    [self.view addSubview:dview];
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
