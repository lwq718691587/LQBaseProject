//
//  LQInitLlizeViewModel.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/26.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQInitLlizeViewModel.h"

@implementation LQInitLlizeViewModel
+(void)getClassName{
    NSLog(@"%@",NSStringFromClass(self));
}

+(void)load{
    NSLog(@"LQInitLlizeViewModel---------load");
}

+ (void)initialize
{
    if (self == [self class]) {
        NSLog(@"LQInitLlizeViewModel---------initialize");
    }
}
@end
