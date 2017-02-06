//
//  LQGoodsViewModel.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/30.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQGoodsViewModel.h"
#import "LQGoodsModel.h"

@interface LQGoodsViewModel ()
@property (strong, nonatomic) LQGoodsModel * model;
@end

@implementation LQGoodsViewModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self getData];
        [self bindModel];

    }
    return self;
}

- (void)getData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.model = [[LQGoodsModel alloc]initWithDic:@{@"goodsPrice_base"        :@"5",
                                                                  @"goodsName_base"         :@"哇哈哈",
                                                                  @"goodsPriceTime_base"    :@"2016年10月8号",
                                                                  @"goodsProducingArea_base":@"北京"}];
        
        self.goodsProducingAreaAndgoodsPrice = [NSString stringWithFormat:@"%@:  %@元/kg",self.model.goodsProducingArea_base,self.model.goodsPrice_base];
        self.goodsPriceTime = self.model.goodsPriceTime_base;
        self.goodsName = self.model.goodsName_base;
    });
}

- (void)bindModel{
    RAC(self,goodsTotalPrice) = [RACObserve(self,buyNumber)map:^id(NSString * value) {
        return [NSString stringWithFormat:@"总价 ：  %ld元",[value integerValue] * [self.model.goodsPrice_base intValue]];
    }];
    RAC(self,isbuyBtnUserInteractionEnabled) = [RACObserve(self, buyNumber)map:^id(id value) {
        return [value integerValue] > 10 ? @(1): @(0);
    }];
    RAC(self,btncolor) = [RACObserve(self, buyNumber)map:^id(id value) {
        return [value integerValue] > 10 ?[UIColor greenColor]: [UIColor redColor];
    }];

}
@end
