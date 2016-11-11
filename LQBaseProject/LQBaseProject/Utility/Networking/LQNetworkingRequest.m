//
//  LQNetworkingRequest.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQNetworkingRequest.h"



@implementation LQNetworkingRequest

static AFHTTPSessionManager * manager;
+(id)shareInstance_manager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = NetworkTimeoutInterval;
        manager.responseSerializer = [AFJSONResponseSerializer serializer];//申明返回的结果是json类型
        manager.requestSerializer  = [AFJSONRequestSerializer serializer];//申明请求的数据是json类型
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain",nil];
    });
    return manager;
}

+(void)openNSURLCache{
    //开启缓存
    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:30  * 1024 * 1024 diskPath:nil];
    [NSURLCache setSharedURLCache:cache];
}

+(void)GET:(NSString *)URLPath
parameters:(id)parameters
 needCache:(BOOL)needCache
   success:(void (^)(id operation, id responseObject))success
   failure:(void (^)(id operation, NSError *error))failure
{
    [self requestWithUrl:URLPath method:@"GET" headers:@{@"Content-Type":@"application/json"} parameters:parameters needCache:needCache success:success failure:failure];
}
+(void)POST:(NSString *)URLPath
 parameters:(id)parameters
    success:(void (^)(id operation, id responseObject))success
    failure:(void (^)(id operation, NSError *error))failure
{
    [self requestWithUrl:URLPath method:@"POST" headers:@{@"Content-Type":@"application/json"} parameters:parameters needCache:NO success:success failure:failure];
}
+(void)PUT:(NSString *)URLPath
parameters:(id)parameters
   success:(void (^)(id operation, id responseObject))success
   failure:(void (^)(id operation, NSError *error))failure
{
    [self requestWithUrl:URLPath method:@"PUT" headers:@{@"Content-Type":@"application/json"} parameters:parameters needCache:NO success:success failure:failure];
}
+(void)DELETE:(NSString *)URLPath
   parameters:(id)parameters
      success:(void (^)(id operation, id responseObject))success
      failure:(void (^)(id operation, NSError *error))failure
{
    [self requestWithUrl:URLPath method:@"DELETE" headers:@{@"Content-Type":@"application/json"} parameters:parameters needCache:NO success:success failure:failure];
}

+(void)requestWithUrl:(NSString *)url
               method:(NSString *)method
              headers:(NSDictionary *)headers
           parameters:(id)parameters
            needCache:(BOOL)needCache
              success:(void (^)(id operation, id responseObject))success
              failure:(void (^)(id operation, NSError *error))failure
{
    
    NSLog(@"请求url:%@\n请求类型:%@\n请求参数:%@",url,method,parameters);
    //有网络的时候走网络
    NSString * finalUrlString = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPSessionManager *manager = [self shareInstance_manager];
    if ([method isEqualToString:@"GET"]) {
        //设置缓存策略
        if (needCache) {
            if (LQAppDelegate.networkStatus > 0) {
                [manager.requestSerializer setCachePolicy:NSURLRequestUseProtocolCachePolicy];
            }else{
                [manager.requestSerializer setCachePolicy:NSURLRequestReturnCacheDataElseLoad];
            }
        }
        [manager GET:finalUrlString parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionTask *task, NSError *error) {
            if (failure) {
                if (error.code == -1009) {
                    [SVProgressHUD showErrorWithStatus:@"网络已断开,请检查网络"];
                }else{
                    failure(task,error);
                }
            }else{
                NSLog(@"服务器异常");
            }
        }];
    }else if ([method isEqualToString:@"POST"]){
        NSLog(@"parameters  == %@",parameters);
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        [manager POST:finalUrlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                if (error.code == -1009) {
                    [SVProgressHUD showErrorWithStatus:@"网络已断开,请检查网络"];
                }else{
                    failure(task,error);
                }
            }else{
                NSLog(@"服务器异常");
            }
        }];
    }else if ([method isEqualToString:@"DELETE"]){
        [manager DELETE:finalUrlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                if (error.code == -1009) {
                    [SVProgressHUD showErrorWithStatus:@"网络已断开,请检查网络"];
                }else{
                    failure(task,error);
                }
            }else{
                NSLog(@"服务器异常");
            }
        }];
    }else if ([method isEqualToString:@"PUT"]){
        [manager PUT:finalUrlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                if (error.code == -1009) {
                    [SVProgressHUD showErrorWithStatus:@"网络已断开,请检查网络"];
                }else{
                    failure(task,error);
                }
            }else{
                NSLog(@"服务器异常");
            }
        }];
    }
}


@end
