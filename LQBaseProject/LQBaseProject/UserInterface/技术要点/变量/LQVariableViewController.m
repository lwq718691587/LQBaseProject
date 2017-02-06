//
//  LQVariableViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2017/1/12.
//  Copyright © 2017年 刘伟强. All rights reserved.
//

#import "LQVariableViewController.h"
//#import "LQVar.h"
#import "LQVariableView.h"

FOUNDATION_EXTERN int GetAge (int a);

@interface LQVariableViewController (){
    //类扩展的成员比变量
    NSString *_age;
}
@end

extern NSInteger lwqAge;
//两个不同的文件中 可以起相同名字的全局静态变量 
static NSString *lwqName = @"lwqStatic";

//NSString *lwqName = @"lwqStatic";//不加static 相同名字错误错误


@implementation LQVariableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LQVariableView *v = [[LQVariableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 300)];
    [self.view addSubview:v];
    
    NSLog(@"%@",v);
    
    NSLog(@"%ld",lwqAge);
    NSLog(@"%@",lwqName);
    int a = 0;
    
    a = GetAge(1);
//    extern int varAge;
//    NSLog(@"varAge: %d",varAge);
    
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

int GetAge (int a)
{
    return 1;
}
