//
//  LQSexyWomanListModel.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseModel.h"

@interface LQSexyWomanListModel : BaseModel

@property (copy, nonatomic) NSString *imageUrl;
@property (nonatomic) NSInteger imageHeight;
@property (nonatomic) NSInteger imageWidth;
+(void)getSexyWomanListArrWithPageNumber:(NSInteger )pageNumber andType:(NSString *)type Success:(void(^)(NSMutableArray * dataArr))success failure:(void(^)())failure;


+(void)getSexyWomanListArrSuccess:(void(^)(NSMutableArray * dataArr))success failure:(void(^)())failure;

@end
