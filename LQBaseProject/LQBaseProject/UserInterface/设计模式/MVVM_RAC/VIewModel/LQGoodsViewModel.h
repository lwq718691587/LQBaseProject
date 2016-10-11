//
//  LQGoodsViewModel.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/30.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseModel.h"
#import "LQGoodsModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>


@interface LQGoodsViewModel : BaseModel

@property (copy, nonatomic)   NSString *goodsName;
@property (copy, nonatomic)   NSString *goodsPriceTime;
@property (copy, nonatomic)   NSString *goodsProducingAreaAndgoodsPrice;
@property (copy, nonatomic)   NSString *goodsTotalPrice;
@property (copy, nonatomic)   NSString *buyNumber;

@property (strong, nonatomic) UIColor *btncolor;
@property (assign, nonatomic) BOOL isbuyBtnUserInteractionEnabled;


@property (strong, nonatomic) RACCommand *buyCommand;

@end
