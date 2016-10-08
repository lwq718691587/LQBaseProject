//
//  LQStoreValue.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/22.
//  Copyright © 2016年 刘伟强. All rights reserved.
//


//存储数据的单利 可以存储自定义的model
#import <Foundation/Foundation.h>

@interface LQStoreValue : NSObject

+(LQStoreValue*)sharedInstace;

-(void)storeValue:(id)value withKey:(NSString *)key;

-(id)valueWithKey:(NSString*)key;

@end
