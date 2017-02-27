//
//  LQCoreImageViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2017/2/23.
//  Copyright © 2017年 刘伟强. All rights reserved.
//

#import "LQCoreImageViewController.h"

@interface LQCoreImageViewController ()

@end

@implementation LQCoreImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIImageView * iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 300)];
    iv.image = [UIImage imageNamed:@"icon"];
    [iv setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:iv];
    
    self.view.backgroundColor = [UIColor redColor];
    UIImageView * iv2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 400, ScreenWidth, 200)];
    
    CGImageRef imageCG = [[UIImage imageNamed:@"icon"] CGImage];
    CGRect subRect = CGRectMake(0, 0, 600, 600);
    CGImageRef cgGroup = CGImageCreateWithImageInRect(imageCG, subRect);
    iv2.image = [UIImage imageWithCGImage:cgGroup];
    
    [iv2 setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:iv2];
    
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
