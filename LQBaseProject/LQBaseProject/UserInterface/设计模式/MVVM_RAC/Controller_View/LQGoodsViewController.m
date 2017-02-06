//
//  LQGoodsViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/30.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQGoodsViewController.h"
#import "LQGoodsViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface LQGoodsViewController ()

@property (strong, nonatomic) LQGoodsViewModel *viewModel;
@property (strong, nonatomic) UILabel * priceLable;
@property (strong, nonatomic) UILabel * nameLable;
@property (strong, nonatomic) UILabel * goodsPriceTimeLable;
@property (strong, nonatomic) UILabel * goodsTotalPriceLable;

@property (strong, nonatomic) UITextField *buyNumberTextField;
@property (strong, nonatomic) UIButton * buyBtn;
@end

@implementation LQGoodsViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
   
    self.viewModel = [[LQGoodsViewModel alloc]init];
    
    
    
    RAC(self.priceLable,text)              = RACObserve(self.viewModel, goodsProducingAreaAndgoodsPrice);
    RAC(self.nameLable,text)               = RACObserve(self.viewModel, goodsName);
    RAC(self.goodsPriceTimeLable,text)     = RACObserve(self.viewModel, goodsPriceTime);
    RAC(self.goodsTotalPriceLable,text)    = RACObserve(self.viewModel, goodsTotalPrice);
    RAC(self.viewModel,buyNumber)          = self.buyNumberTextField.rac_textSignal;
    RAC(self.buyBtn,backgroundColor)       = RACObserve(self.viewModel, btncolor);
    RAC(self.buyBtn,userInteractionEnabled)= RACObserve(self.viewModel, isbuyBtnUserInteractionEnabled);
    
    [[self.buyBtn rac_signalForControlEvents:UIControlEventTouchDown] subscribeNext:^(id x) {
        
    }];
    
}

- (void)createUI{
    for (int i = 0; i < 4; i++) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 35 * i, ScreenWidth, 30)];
        label.backgroundColor = [UIColor redColor];
        label.textColor = [UIColor whiteColor];
        [self.view addSubview:label];
        switch (i) {
            case 0:
                self.priceLable = label;
                break;
            case 1:
                self.nameLable = label;
                break;
            case 2:
                self.goodsPriceTimeLable = label;
                break;
            case 3:
                self.goodsTotalPriceLable = label;
                break;
            default:
                break;
        }
    }
    
    
    self.buyNumberTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 200, ScreenWidth - 100, SFhy(30))];
    self.buyNumberTextField.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.buyNumberTextField];
    
    
    self.buyBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.buyNumberTextField.right+10, self.buyNumberTextField.top, ScreenWidth - self.buyNumberTextField.width-10, self.buyNumberTextField.height)];
    self.buyBtn.backgroundColor = self.buyNumberTextField.backgroundColor;
    [self.buyBtn setTitle:@"buy" forState:UIControlStateNormal];
    [self.view addSubview:self.buyBtn];
}


@end
