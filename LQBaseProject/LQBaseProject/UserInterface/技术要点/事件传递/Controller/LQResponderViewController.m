//
//  LQResponderViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/11/1.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQResponderViewController.h"
#import "LQRedView.h"
#import "LQGreenView.h"
#import "LQBlueView.h"
#import "LQYellowView.h"
#import "LQPinkView.h"
@interface LQResponderViewController ()

@end

@implementation LQResponderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    LQPinkView * p = [[LQPinkView alloc]initWithFrame:self.view.bounds];
    p.backgroundColor = [UIColor flatPinkColor];
    [self.view addSubview:p];
    
    LQRedView * redView = [[LQRedView alloc]initWithFrame:CGRectMake(30, 0, ScreenWidth- 60, 300)];
    redView.backgroundColor = [UIColor redColor];
    [p addSubview:redView];
    
    LQBlueView * blueView = [[LQBlueView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth/2, 150)];
    blueView.backgroundColor = [UIColor blueColor];
    [redView addSubview:blueView];
    
    
    LQYellowView * yellowView = [[LQYellowView alloc]initWithFrame:CGRectMake(150, 150, 100, 150)];
    yellowView.backgroundColor = [UIColor yellowColor];
    [redView addSubview:yellowView];
    
 
    
    LQGreenView * greenView = [[LQGreenView alloc]initWithFrame:CGRectMake(30, 400, ScreenWidth-60, 300)];
    greenView.backgroundColor = [UIColor greenColor];
    [p addSubview:greenView];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
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
