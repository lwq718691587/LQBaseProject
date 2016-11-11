//
//  LQSecondBlockViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/24.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQSecondBlockViewController.h"
#import "LQBlockViewController.h"
@interface LQSecondBlockViewController ()
@property (strong, nonatomic) UITextField * tf ;
@end

@implementation LQSecondBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField * tf = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
    [self.view addSubview:tf];
    tf.backgroundColor = [UIColor redColor];
    self.tf = tf;
    // Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tfBlock(self.tf);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
