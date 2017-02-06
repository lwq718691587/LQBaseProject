//
//  LQHandler_BModel.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/17.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQHandler_BModel.h"

@implementation LQHandler_BModel

- (void)handleRequest:(NSString *)request{
    if ([request intValue] < 1000 && [request intValue] > 500) {
        NSLog(@"B 处理这个数据 %@",request);
    }else{
        if (self.successor) {
            [self.successor handleRequest:request];
        }else{
            NSLog(@"不能处理此请求");
        }
    }
}

@end
