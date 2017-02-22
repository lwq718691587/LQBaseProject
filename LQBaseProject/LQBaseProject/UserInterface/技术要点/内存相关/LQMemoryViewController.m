//
//  LQMemoryViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2017/2/22.
//  Copyright © 2017年 刘伟强. All rights reserved.
//

#import "LQMemoryViewController.h"

@interface LQMemoryViewController ()
@property (copy, nonatomic) NSString *name;
@end

@implementation LQMemoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *bob = @"bob2";
    NSLog(@"%p--%p",&bob,bob);
    self.name = bob;
    NSLog(@"%p",self.name);
    NSLog(@"--%@",self.name);
    bob = @"1";
    NSLog(@"%p--%p",&bob,bob);
    NSLog(@"%p",bob);
    NSLog(@"%p",self.name);
    NSLog(@"--%@",self.name);
    
    
    NSArray * arr = @[@"1",@"2"];
    NSLog(@"%p---%p---%p",&arr,arr,arr[0]);
    
    NSArray * arr2 = [arr copy];
    NSLog(@"%p---%p---%p",&arr2,arr2,arr2[0]);
    
    NSArray * arr3 = [arr mutableCopy];
    NSLog(@"%p---%p---%p\n\n",&arr3,arr3,arr3[0]);
    
    
    
    NSMutableArray * mArr = [NSMutableArray arrayWithArray:@[@"1",@"2"]];
    NSLog(@"%p---%p---%p",&mArr,mArr,mArr[0]);
    
    NSMutableArray * mArr2 = [mArr copy];
    NSLog(@"%p---%p---%p",&mArr2,mArr2,mArr2[0]);
    
    NSMutableArray * mArr3 = [mArr mutableCopy];
    NSLog(@"%p---%p---%p",&mArr3,mArr3,mArr3[0]);
    
    NSLog(@"%@,%@,%@",[mArr class],[mArr2 class],[mArr3 class]);
    
    //
    //
    //
    //    NSString *leo= @"leo";
    //    NSLog(@"%p",leo);
    //    NSString * wahaha = leo;
    //    NSLog(@"%p",wahaha);
    //    NSLog(@"--%@",wahaha);
    //    leo = @"1";
    //    NSLog(@"%p",leo);
    //    NSLog(@"--%@",wahaha);
    
    
    //    NSMutableString *bob2 = [NSMutableString stringWithFormat:@"123"];
    //    NSLog(@"%p",bob2);
    //    self.name = bob2;
    //    NSLog(@"%p",self.name);
    //    NSLog(@"--%@",self.name);
    //    [bob2 appendString:@"rrr"];
    //    NSLog(@"--%@",self.name);
    
    
    //    NSMutableString *bob2 = [NSMutableString stringWithFormat:@"123"];
    //    NSLog(@"%p",bob2);
    //    NSMutableString  * str = bob2;
    //    NSLog(@"%p",str);
    //    NSLog(@"--%@",str);
    //    [bob2 setString:@"rrr"];
    //
    //    bob2 = [NSMutableString stringWithFormat:@"3456"];
    //    NSLog(@"--%@",str);
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
