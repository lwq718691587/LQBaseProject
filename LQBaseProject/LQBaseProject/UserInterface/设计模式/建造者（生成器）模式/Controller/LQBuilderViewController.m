//
//  LQBuilderViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/10.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQBuilderViewController.h"
#import "LQHeroBuilder.h"
#import "LQDirector.h"
#import "LQProductModel.h"
#import "LQAnimalPeopleBuilder.h"
@interface LQBuilderViewController ()

@end

@implementation LQBuilderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //最基础的
    LQabstractActorBuilder * buider1 = [[LQAnimalPeopleBuilder alloc]init];
    LQProductModel * model1 = [LQDirector productConstruct:buider1];
    NSLog(@"%@",model1.costume);
    
    //进阶1
    LQabstractActorBuilder * buider2 = [[LQHeroBuilder alloc]init];
    LQProductModel * model2 = [LQabstractActorBuilder productConstruct:buider2];
    NSLog(@"%@",model2.costume);
    
    //进阶2
    LQabstractActorBuilder * buider3 = [[LQAnimalPeopleBuilder alloc]init];
    LQProductModel * model3 = [buider3 productConstruct];
    NSLog(@"%@",model3.costume);
    
    
    
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
