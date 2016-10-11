//
//  LQCopyViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/10.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQCopyViewController.h"
#import "LQClassModel.h"
@interface LQCopyViewController ()

@end

@implementation LQCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LQClassModel * model = [[LQClassModel alloc]init];
    model.className = @"高一（1）班";
    model.classAdress = @"北京市朝阳区崔各庄小学";
    model.classStudentsNumber = @"54";
    
    LQClassModel * newModel = [model copy];
    
    NSLog(@"%p---%p",model.classAdress,newModel.classAdress);
    
    LQClassModel * newModel2 = [model mutableCopy];
    
    
    NSLog(@"%p---%p---%p",model.classAdress,newModel.classAdress,newModel2.classAdress);
    
}



@end
