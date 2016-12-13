//
//  LQCGViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/12/7.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQCGViewController.h"
#import "LQCustomView.h"
#import "LQCustomImageVIew.h"
@interface LQCGViewController ()

@end

@implementation LQCGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LQCustomView * v = [[LQCustomView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 300)];
    v.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:v];
    
    LQCustomImageVIew * iv = [[LQCustomImageVIew alloc]initWithFrame:CGRectMake(0, 0, 141/2, 132/2)];
    iv.backgroundColor = [UIColor redColor];
    iv.center = CGPointMake(self.view.width/2, self.view.height/2 - 64);
    iv.image = [UIImage imageNamed:@"111111.png"];
    
    
    UIImageView * mask = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, iv.width, iv.height)];
    mask.image = [UIImage imageNamed:@"22222.png"];
    
    iv.maskView = mask;
    
    [self.view addSubview:iv];
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
