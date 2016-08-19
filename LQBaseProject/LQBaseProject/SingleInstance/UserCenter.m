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
        userCenter = [[UserCenter alloc]init];
    });
    return userCenter;
}


@end
