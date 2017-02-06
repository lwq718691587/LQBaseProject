//
//  NSObject+StareValeu.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/22.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (StareValeu)

- (void)storeValueWithKey:(NSString *)key;

+(id)valueByKey:(NSString *)key;

@end
