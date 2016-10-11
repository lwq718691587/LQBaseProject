//
//  LQRunTimeViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/31.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQRunTimeViewController.h"
#import "LQPerson.h"
#import "LQPerson+nameProperty.h"
#import "NSObject+model.h"
#import "LQInitLlizeViewModel.h"
@interface LQRunTimeViewController ()

@end

@implementation LQRunTimeViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    //
    UIImage * image = [UIImage imageNamed:@"asd"];
    NSLog(@"%@",NSStringFromCGSize(image.size));
    [LQInitLlizeViewModel getClassName];
    
    NSObject * objc = [[NSObject alloc]init];
    NSLog(@"%@",objc);
    
    NSDictionary * personDic = @{@"name":@"刘伟强",@"height":@"170",@"sex":@"男"};
    
    LQPerson * bob = [LQPerson modelWithDict:personDic];
    
    [bob performSelector:@selector(peopleJump)];
    NSLog(@"%@ - %@ - %@",bob.name, bob.height ,bob.sex);
    
    int i = [bob performSelector:@selector(myEat:) withObject:@"1"];
    
    
    
    NSLog(@"%d",i);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
