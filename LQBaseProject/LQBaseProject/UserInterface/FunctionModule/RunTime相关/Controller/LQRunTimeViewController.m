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
@interface LQRunTimeViewController ()

@end

@implementation LQRunTimeViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    //
    UIImage * image = [UIImage imageNamed:@"asd"];
    
    
    NSObject * objc = [[NSObject alloc]init];

    
    NSDictionary * personDic = @{@"name":@"刘伟强",@"height":@"170",@"sex":@"男"};
    
    LQPerson * bob = [LQPerson modelWithDict:personDic];
   
    NSLog(@"%@ - %@ - %@",bob.name, bob.height ,bob.sex);
    
    
    [bob performSelector:@selector(eat)];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
