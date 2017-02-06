//
//  LQSecondBlockViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/24.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQSecondBlockViewController.h"
#import "LQBlockViewController.h"


typedef int(^success)(NSString *states);


@interface LQSecondBlockViewController ()

@property (nonatomic) success networkingSuccess;
@property (nonatomic) void(^failerBlock)();
@property (strong, nonatomic) UITextField * tf ;
@end

@implementation LQSecondBlockViewController


- (void)viewDidLoad {
    [super viewDidLoad];
 

    NSArray * const a = [NSArray array];
    
    
    self.networkingSuccess = ^(NSString *states){
        return 1;
    };
    
    self.failerBlock = ^(){
        
    };
    
    [self lwqNetWorkingsuccess:^(NSString *states) {
        
    }];
    
    
    void(^block)(int i) = ^(int i){
        
    };
    block(1);
    UITextField * tf = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
    [self.view addSubview:tf];
    tf.backgroundColor = [UIColor redColor];
    self.tf = tf;
    // Do any additional setup after loading the view.
}

- (void)lwqNetWorkingsuccess:(void(^)(NSString * states)) success{
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tfBlock(self.tf);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
