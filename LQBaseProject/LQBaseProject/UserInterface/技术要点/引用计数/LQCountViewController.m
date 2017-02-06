//
//  LQCountViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/30.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQCountViewController.h"

@interface LQCountViewController ()

@property (strong, nonatomic) NSString *firstStr;

@end

@implementation LQCountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstStr = @"one";
    
    __weak typeof(self) safeSelf = self;
    
    
    [self block:^(NSString *str) {
        NSString * sumStr = [NSString stringWithFormat:@"%@-%@",safeSelf.firstStr,str];
        NSLog(@"%@",sumStr);
    }];
    
    // Do any additional setup after loading the view.
}

- (void)block:(void(^)(NSString * str))success{
    NSString * str = @"one";
    success(str);
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
