//
//  LQStoreValue.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/22.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQStoreValue.h"
#import "FastCoder.h"

static LQStoreValue * storeValue = nil;

@implementation LQStoreValue

+(LQStoreValue*)sharedInstace{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        storeValue = [[LQStoreValue alloc]init];
    });
    return storeValue;
}

- (void)storeValue:(id)value withKey:(NSString *)key{
    NSParameterAssert(value);
    NSParameterAssert(key);
    NSData * data = [FastCoder dataWithRootObject:value];
    if (data) {
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    }
}
- (id)valueWithKey:(NSString*)key{
    NSParameterAssert(key);
    NSData * data = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    return [FastCoder objectWithData:data];
}

@end
