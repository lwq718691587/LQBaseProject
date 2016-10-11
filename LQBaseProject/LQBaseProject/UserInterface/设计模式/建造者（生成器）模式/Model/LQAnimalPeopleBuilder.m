//
//  LQAnimalPeopleBuilder.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/10.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQAnimalPeopleBuilder.h"


@implementation LQAnimalPeopleBuilder


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.actor = [[LQProductModel alloc]init];
    }
    return self;
}

-(void)bulideSex{
    self.actor.sex = @"雄性";
}
-(void)bulideFace{
    self.actor.face = @"🐴";
}
-(void)bulideType{
    self.actor.type = @"兽人";
}
-(void)bulideCostume{
    self.actor.costume = @"动物的服装";
}

-(LQProductModel*)createActor{
    return self.actor;
}

-(BOOL)isHaveCostume{
    return NO;
}
@end
