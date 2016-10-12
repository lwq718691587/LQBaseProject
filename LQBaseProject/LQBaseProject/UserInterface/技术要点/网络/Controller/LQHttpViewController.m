//
//  LQHttpViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/12.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQHttpViewController.h"
#import "LQNetworking.h"
#import "LQMacro.h"
@interface LQHttpViewController ()

@end

@implementation LQHttpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //http://3ciyuan.cn:12001/v1/579ee295eed471e92bbc3ecd/prizeList
    
    [self initUI];
    
//    [SVProgressHUD show];
    [LQNetworking getRequestWithUrlStr:@"http://3ciyuan.cn:12001/v1/579ee295eed471e92bbc3ecd/prizeList" success:^(id data) {
        NSLog(@"%@",data);
//        [SVProgressHUD dismiss];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
//        [SVProgressHUD dismiss];
    }];
    

    [LQNetworking postRequestWithUrlStr:@"http://3ciyuan.cn:12001/v1/signin" parameters:@{@"account":@"17600802935",@"passwdmd5":[@"111111" MD5]} success:^(id data) {
        NSLog(@"%@",data);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];

    // Do any additional setup after loading the view.
}

-(void)initUI{
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    btn.backgroundColor = [UIColor flatRedColor];
    [btn addTarget:self action:@selector(btnFun) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    
}
-(void)btnFun{
    NSLog(@"121");
}
@end
