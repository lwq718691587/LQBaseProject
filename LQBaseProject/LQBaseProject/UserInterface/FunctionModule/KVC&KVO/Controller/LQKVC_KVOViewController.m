//
//  LQKVC&KVOViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/20.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQKVC_KVOViewController.h"
#import "LQPeopleModel.h"
@interface LQKVC_KVOViewController ()
@property (strong, nonatomic) NSMutableArray * peopleArr;
@end

@implementation LQKVC_KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.peopleArr = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        LQPeopleModel * people = [[LQPeopleModel alloc]init];
        people.name = [NSString stringWithFormat:@"wang%d",i];
        people.age  = [NSString stringWithFormat:@"age - %d",i];
        [self.peopleArr addObject:people];
    }
    
    self.peopleArr = [self.peopleArr valueForKeyPath:@"name.capitalizedString"];
    
    for (LQPeopleModel * model in self.peopleArr) {
        NSLog(@"%@",[model valueForKey:@"name"]);
    }
    
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
