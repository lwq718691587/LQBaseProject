//
//  LQChainofResponsibilityViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/17.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQChainofResponsibilityViewController.h"
#import "LQHandlerModel.h"
#import "LQHandler_AModel.h"
#import "LQHandler_BModel.h"
#import "LQHandler_CModel.h"
@interface LQChainofResponsibilityViewController ()

@end

@implementation LQChainofResponsibilityViewController

- (void)viewDidLoad {
//    http://blog.csdn.net/lovelion/article/details/7420902 学习地址
    [super viewDidLoad];
    LQHandlerModel * handlerA ,  *handlerB , *handlerC;
    handlerA = [[LQHandler_AModel alloc]init];
    handlerB = [[LQHandler_BModel alloc]init];
    handlerC = [[LQHandler_CModel alloc]init];
    
    handlerA.successor = handlerB;
    handlerB.successor = handlerC;
    
    [handlerA handleRequest:@"2000"];
    
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
