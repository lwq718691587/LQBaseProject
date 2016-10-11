//
//  LQDirector.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/10.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQDirector.h"
#import "LQabstractActorBuilder.h"



@implementation LQDirector




+(LQProductModel *)productConstruct:(LQabstractActorBuilder *)builder{
    [builder bulideSex];
    if (builder.isHaveCostume) {
        [builder bulideCostume];
    }

    [builder bulideType];
    [builder bulideFace];
    return builder.createActor;
}

@end
