//
//  NSObject+model.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/6.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (model)

+ (void)resolveDict:(NSDictionary *)dict;

+(instancetype)modelWithDict:(NSDictionary *)dic;

@end
