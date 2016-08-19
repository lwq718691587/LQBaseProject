//
//  LQSexyWomanListModel.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQSexyWomanListModel.h"


@implementation LQSexyWomanListModel

+(void)getSexyWomanListArrWithPageNumber:(NSInteger )pageNumber Success:(void(^)(NSMutableArray * dataArr))success failure:(void(^)())failure{
    
    [LQNetworkingRequest GET:[NSString stringWithFormat:@"%@?page=%ld",imageListUrl,pageNumber] parameters:nil needCache:YES success:^(id operation, id responseObject) {
        NSMutableArray * dataArr = [NSMutableArray array];
        for (NSDictionary *perDic in responseObject[@"tngou"]) {
            LQSexyWomanListModel * model = [[LQSexyWomanListModel alloc]init];
            model.imageUrl = perDic[@"img"];
            [dataArr addObject:model];
        }
        success(dataArr);
    } failure:^(id operation, NSError *error) {
        
    }];
}
@end
