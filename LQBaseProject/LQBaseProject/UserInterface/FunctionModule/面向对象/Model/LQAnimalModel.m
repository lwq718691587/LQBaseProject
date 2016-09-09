//
//  LQAnimalModel.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/8.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQAnimalModel.h"

@implementation LQAnimalModel


- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        self.name = name;
        self.number = 1;
    }
    return self;
}

-(void)shout{
    NSString * str = [NSString stringWithFormat:@"我的名字是%@: %@ * %ld",self.name,[self getShoutSound],self.number];
    NSLog(@"%@",str);
}

-(NSString *)getShoutSound{
    return @"";
}


@end
