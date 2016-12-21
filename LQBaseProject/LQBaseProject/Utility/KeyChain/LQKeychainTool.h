//
//  LQKeychainTool.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/12/21.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQKeychainTool : NSObject


+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service ;

+ (void)save:(NSString *)service data:(id)data ;

+ (id)load:(NSString *)service ;

+ (void)delete:(NSString *)service ;

@end
