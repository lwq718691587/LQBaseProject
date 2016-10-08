//
//  LQNetworkingRequest.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LQMacro.h"
#import <AFNetworking.h>

@interface LQNetworkingRequest : NSObject

//afn 请求单例
+(id)shareInstance_manager;
//打开系统缓存
+(void)openNSURLCache;

/**
 *  get请求
 */
+(void)GET:(NSString *)URLPath
parameters:(id)parameters
 needCache:(BOOL)needCache
   success:(void (^)(id operation, id responseObject))success
   failure:(void (^)(id operation, NSError *error))failure;
/**
 *  POST请求
 */
+(void)POST:(NSString *)URLPath
 parameters:(id)parameters
    success:(void (^)(id operation, id responseObject))success
    failure:(void (^)(id operation, NSError *error))failure;
/**
 *  PUT请求
 */
+(void)PUT:(NSString *)URLPath
parameters:(id)parameters
   success:(void (^)(id operation, id responseObject))success
   failure:(void (^)(id operation, NSError *error))failure;
/**
 *  DELETE请求
 */
+(void)DELETE:(NSString *)URLPath
   parameters:(id)parameters
      success:(void (^)(id operation, id responseObject))success
      failure:(void (^)(id operation, NSError *error))failure;



@end
