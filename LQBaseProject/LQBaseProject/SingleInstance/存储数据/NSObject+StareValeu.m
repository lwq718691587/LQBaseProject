//
//  NSObject+StareValeu.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/22.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "NSObject+StareValeu.h"
#import "LQStoreValue.h"
@implementation NSObject (StareValeu)


- (void)storeValueWithKey:(NSString *)key{
    [[LQStoreValue sharedInstace] storeValue:self withKey:key];
}

+(id)valueByKey:(NSString *)key{
    return [[LQStoreValue sharedInstace] valueForKey:key];
}

@end
