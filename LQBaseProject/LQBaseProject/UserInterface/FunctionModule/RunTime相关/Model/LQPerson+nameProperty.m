//
//  LQPerson+nameProperty.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/6.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQPerson+nameProperty.h"
#import <objc/runtime.h>

// 定义关联的key
static const char *key = "name";

@implementation LQPerson (nameProperty)


-(NSString *)name{
    return objc_getAssociatedObject(self, key);
}

-(void)setName:(NSString *)name{
    objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
