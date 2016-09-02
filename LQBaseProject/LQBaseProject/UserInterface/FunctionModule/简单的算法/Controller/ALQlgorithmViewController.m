//
//  ALQlgorithmViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/2.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "ALQlgorithmViewController.h"

@interface ALQlgorithmViewController ()

@end

@implementation ALQlgorithmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"%d",[self funSumOne:100]);
    NSLog(@"%d",[self funSumTwo:100]);
    
    NSLog(@"%d",[self funMult:4]);
    

    
    // Do any additional setup after loading the view.
}


-(int)funSumOne:(int)n{
    return (1 + n) * (n / 2);
}
-(int)funSumTwo:(int)n{
    int sum = 0;
    for (int i = 0; i <= n; i++) {
        sum = sum + i;
    }
    return sum;
}

-(int)funMult:(int)n{
    int sum = 1 ;
    for (int i = n ; i > 0; i--) {
        sum = sum * i;
    }
    return sum;
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
