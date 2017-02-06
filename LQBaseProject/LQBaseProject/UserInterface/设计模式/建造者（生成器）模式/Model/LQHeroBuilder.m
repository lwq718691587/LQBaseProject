//
//  LQHeroBuilder.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/10.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQHeroBuilder.h"


@implementation LQHeroBuilder


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.actor = [[LQProductModel alloc]init];
    }
    return self;
}

- (void)bulideSex{
    self.actor.sex = @"男";
}
- (void)bulideFace{
    self.actor.face = @"人的脸";
}
- (void)bulideType{
    self.actor.type = @"人类";
}
- (void)bulideCostume{
    self.actor.costume = @"人类的服装";
}

- (LQProductModel*)createActor{
    return self.actor;
}

- (BOOL)isHaveCostume{
    return YES;
}
@end
