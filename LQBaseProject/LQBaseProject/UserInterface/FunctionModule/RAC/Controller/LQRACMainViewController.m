//
//  LQRACMainViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/30.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQRACMainViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "LQRACNotificationViewController.h"
#import "LQRACModel.h"
@interface LQRACMainViewController ()

@property (strong, nonatomic) UITextField *textField1;
@property (strong, nonatomic) UIButton    *btn1;
@property (strong, nonatomic) UILabel     *label1;
@end

@implementation LQRACMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    // Do any additional setup after loading the view.
}
-(void)createView{
    self.textField1 = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth - 100, SFhy(30))];
    self.textField1.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.textField1];
    
    [[self.textField1 rac_signalForControlEvents:UIControlEventEditingDidEnd]subscribeNext:^(id x) {
        NSLog(@"UIControlEventValueChanged");
    }];
    
    [[self.textField1 rac_textSignal]subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    self.btn1 = [[UIButton alloc]initWithFrame:CGRectMake(self.textField1.right+10, 0, ScreenWidth - self.textField1.width-10, self.textField1.height)];
    self.btn1.backgroundColor = self.textField1.backgroundColor;
    [self.btn1 setTitle:@"跳转" forState:UIControlStateNormal];
    [self.view addSubview:self.btn1];
    
    [[self.btn1 rac_signalForControlEvents:UIControlEventTouchDown]subscribeNext:^(id x) {
        LQRACNotificationViewController *vc =[[LQRACNotificationViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    
    UILabel * label1 = [[UILabel alloc]initWithFrame:self.textField1.frame];
    label1.top = self.textField1.bottom + 5;
    label1.backgroundColor = self.textField1.backgroundColor;
    label1.text = @"测试label";
    label1.userInteractionEnabled = YES;
    [self.view addSubview:label1];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]init];
    [[tap rac_gestureSignal]subscribeNext:^(id x) {
        NSLog(@"tap");
    }];
    [label1 addGestureRecognizer:tap];
    self.label1 = label1;
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"RACtest" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    [alert show];
    
    [[self rac_signalForSelector:@selector(alertView:clickedButtonAtIndex:) fromProtocol:@protocol(UIAlertViewDelegate)]subscribeNext:^(RACTuple * tuple) {
        NSLog(@"%@",tuple.first);
    }];
    
    [[[NSNotificationCenter defaultCenter]rac_addObserverForName:@"postData" object:nil]subscribeNext:^(id x) {
        NSNotification * notification = x;
        self.label1.text = notification.object;
        
    }];
    
    
    LQRACModel * model = [[LQRACModel alloc]init];
    model.version_rac = 1;
    [RACObserve(model, version_rac) subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    UIButton * modelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.label1.bottom+5, SFwx(200), SFhy(30))];
    
    modelBtn.backgroundColor = self.textField1.backgroundColor;
    [modelBtn setTitle:@"modelbtn" forState:UIControlStateNormal];
    [self.view addSubview:modelBtn];
    
    [[modelBtn rac_signalForControlEvents:UIControlEventTouchDown]subscribeNext:^(id x) {
        model.version_rac++;
    }];

    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
