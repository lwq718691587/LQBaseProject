//
//  LQSexyWomanListModel.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQSexyWomanListModel.h"
#import "LQNetworkingRequest.h"
#import "NSObject+model.h"

@implementation LQSexyWomanListModel

+(void)getSexyWomanListArrWithPageNumber:(NSInteger )pageNumber andType:(NSString *)type Success:(void(^)(NSMutableArray * dataArr))success failure:(void(^)())failure{
    
    [LQNetworkingRequest GET:imageListUrl(pageNumber,type) parameters:nil needCache:YES success:^(id operation, id responseObject) {
        
      
        
        NSMutableArray * dataArr = [NSMutableArray array];
        for (NSDictionary *perDic in responseObject[@"data"]) {
            LQSexyWomanListModel * model = [[LQSexyWomanListModel alloc]init];
            model.imageUrl = perDic[@"image_url"];
            model.imageWidth = [perDic[@"image_width"] integerValue];
            model.imageHeight = [perDic[@"image_height"] integerValue];
            if (model.imageHeight < 1000 && model.imageHeight > 600) {
                [dataArr addObject:model];
            }
        }
        success(dataArr);
    } failure:^(id operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

+(void)getSexyWomanListArrSuccess:(void(^)(NSMutableArray * dataArr))success failure:(void(^)())failure{
    
    [LQNetworkingRequest GET:imageListUrlNoPageNumber parameters:nil needCache:YES success:^(id operation, id responseObject) {
        NSMutableArray * dataArr = [NSMutableArray array];
        for (NSDictionary *perDic in responseObject[@"data"]) {
            LQSexyWomanListModel * model = [[LQSexyWomanListModel alloc]init];
            model.imageUrl = perDic[@"image_url"];
            model.imageWidth = [perDic[@"image_width"] integerValue];
            model.imageHeight = [perDic[@"image_height"] integerValue];
            [dataArr addObject:model];
        }
        success(dataArr);
    } failure:^(id operation, NSError *error) {
        
    }];
}

@end
