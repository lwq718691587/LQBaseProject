//
//  LQNetworking.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/12.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import <Foundation/Foundation.h>

#define settingTimeoutInterval 5

@interface LQNetworking : NSObject

+(void)getRequestWithUrlStr:(NSString *)urlStr
                    success:(void(^)(id data))success
                    failure:(void(^)(NSError * error))failure;

+(void)postRequestWithUrlStr:(NSString *)urlStr
                  parameters:(NSDictionary*)parameters
                     success:(void(^)(id data))success
                     failure:(void(^)(NSError * error))failure;

@end
