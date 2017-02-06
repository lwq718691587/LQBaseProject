//
//  LQabstractActorBuilder.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/10.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQabstractActorBuilder.h"

@implementation LQabstractActorBuilder




- (void)bulideType{}
- (void)bulideSex{}
- (void)bulideFace{}
- (void)bulideCostume{}

- (LQProductModel*)createActor{
    return nil;
}


+(LQProductModel *)productConstruct:(LQabstractActorBuilder *)builder;{
    [builder bulideSex];
    [builder bulideCostume];
    [builder bulideType];
    [builder bulideFace];
    return builder.createActor;
}

- (LQProductModel *)productConstruct{
    [self bulideFace];
    [self bulideType];
    [self bulideCostume];
    [self bulideSex];
    return self.createActor;
}
- (BOOL)isHaveCostume{
    return YES;
}

@end
