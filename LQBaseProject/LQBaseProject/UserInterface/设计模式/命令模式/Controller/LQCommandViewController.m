//
//  LQCommandViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/17.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQCommandViewController.h"

#import "LQCommand_A.h"
#import "LQCommandAReciver.h"

#import "LQCommand_B.h"
#import "LQCommandBReciver.h"

#import "LQInvoker.h"

#import "LQCommandQueue.h"
#import "LQInvokerQueue.h"
@interface LQCommandViewController ()

@end

@implementation LQCommandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    http://blog.csdn.net/lovelion/article/details/8796736 学习地址
    
    
    
    LQCommand_A * commandA = [[LQCommand_A  alloc]init];
    commandA.reciver = [[LQCommandAReciver alloc]init];
//    
//
//    
//    LQInvoker * invokerA = [[LQInvoker alloc]init];
//    invokerA.command = commandA;
//    [invokerA call];
//    
//    
    LQCommand_B * commandB = [[LQCommand_B  alloc]init];
    commandB.reciver = [[LQCommandBReciver alloc]init];
//
//    LQInvoker * invokerB = [[LQInvoker alloc]init];
//    invokerB.command = commandA;
//    [invokerB call];
    
    
    LQCommandQueue * commandQueue = [[LQCommandQueue alloc]init];
    [commandQueue addCommand:commandA];
    [commandQueue addCommand:commandB];
    
    LQInvokerQueue * invokerQueue = [[LQInvokerQueue alloc]init];
    invokerQueue.commandQueue = commandQueue;
    [invokerQueue call];
    
    
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
