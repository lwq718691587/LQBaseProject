//
//  LQDirector.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/10.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseModel.h"
#import "LQabstractActorBuilder.h"
#import "LQProductModel.h"
@interface LQDirector : BaseModel


+(LQProductModel *)productConstruct:(LQabstractActorBuilder *)builder;

@end
