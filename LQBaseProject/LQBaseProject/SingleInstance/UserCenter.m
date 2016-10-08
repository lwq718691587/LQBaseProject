//
//  UserCenter.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "UserCenter.h"


static UserCenter *userCenter = nil;

@implementation UserCenter

+(UserCenter *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userCenter = (UserCenter *)@"UserCenter";
        userCenter = [[UserCenter alloc]init];
    });
    return userCenter;
}
//防止外部调用init 方法
- (instancetype)init
{
    NSString * string = (NSString *)userCenter;
    if ([string isKindOfClass:[NSString class]] && [string isEqualToString:@"UserCenter"]) {
        self = [super init];
        if (self) {
            
        }
        return self;
    }else{
        return nil;
    }
}

@end
