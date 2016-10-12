//
//  LQDeveloperUtilityModel.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/12.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQDeveloperUtilityModel.h"

@implementation LQDeveloperUtilityModel


+(NSMutableArray*)getdataArr{
    NSMutableArray<LQDeveloperUtilityModel *> *finalArr = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"LQDeveloperUtilityPlist" ofType:@"plist"];
    NSArray * dataArr = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary * perDic in dataArr) {
        LQDeveloperUtilityModel * model = [[LQDeveloperUtilityModel alloc]init];
        model.title = perDic[@"title"];
        model.url   = perDic[@"downloadUrl"];
        [finalArr addObject:model];
    }
    return finalArr;
}
@end
