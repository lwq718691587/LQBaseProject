//
//  LQSqliteViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/14.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQSqliteViewController.h"
#import "LQSqlite.h"
@interface LQSqliteViewController ()

@end

@implementation LQSqliteViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    LQSqlite * s = [[LQSqlite alloc]init];
//    [s removeDataBase];
    [s createDataBase];
    [s saveDatawithStudentNum:@"110220039" withClassName:@"软件二班" withStudentName:@"刘伟强39"];
    [s saveDatawithStudentNum:@"110220038" withClassName:@"软件二班" withStudentName:@"刘伟强38"];
//    [s saveDatawithStudentNum:@"110220037" withClassName:@"软件二班" withStudentName:@"刘伟强37"];
//    [s saveDatawithStudentNum:@"110220036" withClassName:@"软件二班" withStudentName:@"刘伟强36"];
//    [s saveDatawithStudentNum:@"110220035" withClassName:@"软件二班" withStudentName:@"刘伟强35"];
//    [s saveDatawithStudentNum:@"110220034" withClassName:@"软件二班" withStudentName:@"刘伟强34"];
    
    [s searchAllinfo];
//    [s searchDatawithStudentNum:@"110220035"];
    
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
