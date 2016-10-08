//
//  LQGoodsModel.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/30.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseModel.h"

@interface LQGoodsModel : BaseModel

- (instancetype)initWithDic:(NSDictionary *)dic;

@property (copy, nonatomic) NSString *goodsPrice_base;
@property (copy, nonatomic) NSString *goodsName_base;
@property (copy, nonatomic) NSString *goodsPriceTime_base;
@property (copy, nonatomic) NSString *goodsProducingArea_base;

@end
