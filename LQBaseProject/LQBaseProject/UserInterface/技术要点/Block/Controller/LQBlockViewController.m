//
//  LQBlockViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/24.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQBlockViewController.h"
#import "LQBlockView.h"
#import "LQSecondBlockViewController.h"
@interface LQBlockViewController ()

@property (nonatomic) NSInteger number;
@property (copy, nonatomic) NSString *value;

@property (strong, nonatomic) LQBlockView *bv;

@property (strong, nonatomic) LQSecondBlockViewController * secondVc;

@property (strong, nonatomic) UILabel *mylabel;
@end

@implementation LQBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bv = [[LQBlockView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 90)];
    [self.view addSubview:self.bv];
//    self.value = @"123";
//    self.number = 0;
    __block int key = 0;
    
    __weak typeof(self) safeSelf = self;
    
//    [self.bv setSuccess:^(NSString *a, NSString *b) {
//        safeSelf.number = 5;
//        key = 5;
//        NSLog(@"%@-%@-%ld",a,b,(long)safeSelf.number);
//        [safeSelf.navigationController popViewControllerAnimated:YES];
//    }];
//    
//    [self.bv setRedBtnBlock:^(){
//        [safeSelf.navigationController popViewControllerAnimated:YES];
//    }];
    
    
    LQBlockView * bv2 = [[LQBlockView alloc]initWithFrame:CGRectMake(0, 90, ScreenWidth, 90)];
    [self.view addSubview:bv2];
    
    [bv2 setRedBtnBlock2:^(){
        self.secondVc = [[LQSecondBlockViewController alloc]init];
        [self.secondVc setTfBlock:^(UITextField *tf) {
            NSLog(@"%@",tf.text);
        }];
        [self.navigationController pushViewController:self.secondVc animated:YES];
    }];
    
    NSLog(@"%ld",(long)self.number);
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0,180, ScreenWidth, 30)];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnfun) forControlEvents:UIControlEventTouchDown];
    
    self.mylabel = [[UILabel alloc]initWithFrame:CGRectMake(0,210, ScreenWidth, 30)];
    [self.view addSubview:self.mylabel];
    
    // Do any additional setup after loading the view.
}
-(void)btnfun{
    self.secondVc = [[LQSecondBlockViewController alloc]init];
    __weak typeof(self) safeSelf = self;
    [self.navigationController pushViewController:self.secondVc animated:YES];
    [self.secondVc setTfBlock:^(UITextField *tf) {
        safeSelf.mylabel.text = tf.text;
    }];
    
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
