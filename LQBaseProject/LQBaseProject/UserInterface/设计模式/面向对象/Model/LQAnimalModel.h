//
//  LQAnimalModel.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/8.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseModel.h"


@interface LQAnimalModel : BaseModel

@property (copy, nonatomic) NSString *name;
@property (nonatomic) NSInteger number;


- (instancetype)initWithName:(NSString*)name;
- (void)shout;

- (NSString *)getShoutSound;


@end
