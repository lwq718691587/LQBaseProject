//
//  LQBridgePatternViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/11.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQBridgePatternViewController.h"
#import "LQAbstractPenModel.h"
#import "LQAbstractPenColorModel.h"
#import "LQSmallPenModel.h"
#import "LQRedPenColorModel.h"
#import "LQBlackPenColorModel.h"
#import "LQBIgPenModel.h"
@interface LQBridgePatternViewController ()

@end

@implementation LQBridgePatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //http://blog.csdn.net/lovelion/article/details/7464208 这是桥接模式和适配器模式的联用
//    LQAbstractPenModel * pen = [[LQSmallPenModel alloc]init];
//    LQAbstractPenColorModel * color = [[LQRedPenColorModel alloc]init];
//    [pen setPencolor:color];
//    [pen usePenDrawLine:@"圆"];
    
    
    LQAbstractPenModel * pen = [[LQBIgPenModel alloc]init];
    LQAbstractPenColorModel * color = [[LQBlackPenColorModel alloc]init];
    [pen setPencolor:color];
    [pen usePenDrawLine:@"圆"];
    
    // Do any additional setup after loading the view.
}


@end
