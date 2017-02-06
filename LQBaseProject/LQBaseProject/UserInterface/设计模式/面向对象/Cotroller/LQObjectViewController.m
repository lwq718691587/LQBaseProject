//
//  LQObjectViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/8.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQObjectViewController.h"
#import "LQCatModel.h"
#import "LQDogModel.h"
#import "LQAnimalModel.h"

@interface LQObjectViewController ()


@property (strong, nonatomic) NSMutableArray *animalArr;
@end

@implementation LQObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //面向对象  封装 继承 多肽
    self.title = @"面向对象";
    self.animalArr = [[NSMutableArray alloc]init];

    
    
    for (int i = 0; i < 2; i++) {
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100 * i, 0, 100, 100)] ;
        [btn setTitle: i == 0 ?@"动物报名" : @"开始比赛" forState:UIControlStateNormal];
        btn.backgroundColor = FlatRed;
        [btn addTarget:self action:@selector(btnFun:) forControlEvents:UIControlEventTouchDown];
        btn.tag = i;
        [self.view addSubview:btn];
    }

    // Do any additional setup after loading the view.
}

- (void)btnFun:(UIButton *)btn{
    
    if (btn.tag == 0) {
        LQCatModel * cat1 = [[LQCatModel alloc]initWithName:@"花花"];
        [self.animalArr addObject:cat1];
        LQDogModel * dog1 = [[LQDogModel alloc]initWithName:@"小白"];
        [self.animalArr addObject:dog1];
        LQCatModel * cat2 = [[LQCatModel alloc]initWithName:@"咪咪"];
        [self.animalArr addObject:cat2];
        LQDogModel * dog2 = [[LQDogModel alloc]initWithName:@"小黑"];
        [self.animalArr addObject:dog2];
    }else{
        for (LQAnimalModel * m in self.animalArr) {
            [m shout];
        }
    }
}

@end
