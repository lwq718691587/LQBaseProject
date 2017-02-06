//
//  LQNetworking.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/12.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQNetworking.h"


@interface LQNetworking ()<NSURLSessionDownloadDelegate>

@end
@implementation LQNetworking


+(void)baseRequestwith:(NSString *)urlStr parameters:(NSDictionary*)parameters success:(void(^)(id data))success failure:(void(^)(NSError * error))failure{
    
    NSURLSession * session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSMutableURLRequest * mRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:settingTimeoutInterval];
    
    if (parameters.count != 0) {
        mRequest.HTTPMethod = @"POST";
        __block NSString * parameterStr = @"";
        [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            parameterStr = [parameterStr stringByAppendingFormat:@"&%@",[NSString stringWithFormat:@"%@=%@",key,obj]];
        }];
        mRequest.HTTPBody = [[parameterStr substringFromIndex:1] dataUsingEncoding:NSUTF8StringEncoding];
    }else{
        mRequest.HTTPMethod = @"GET";
    }
 
    NSURLSessionDataTask *task = [session dataTaskWithRequest:mRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            id dicJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            success(dicJson);
        }else{
            failure(error);
        }
    }];
    [task resume];
}


+(void)getRequestWithUrlStr:(NSString *)urlStr
                    success:(void(^)(id data))success
                    failure:(void(^)(NSError * error))failure{
    [self baseRequestwith:urlStr parameters:nil success:success failure:failure];
}

+(void)postRequestWithUrlStr:(NSString *)urlStr
                  parameters:(NSDictionary*)parameters
                     success:(void(^)(id data))success
                     failure:(void(^)(NSError * error))failure{
    [self baseRequestwith:urlStr parameters:parameters success:success failure:failure];
}

+(void)downloadWithUrlStr:(NSString *)urlStr
                  success:(void(^)(id data))success
                  failure:(void(^)(NSError * error))failure{

    NSURLSession * session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURL *url = [NSURL URLWithString:urlStr];

    
    
    NSURLSessionDownloadTask * task = [session downloadTaskWithURL:url];
    
    
    [task resume];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    
}

@end
