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

+(void)getSexyWomanListArrWithPageNumber:(NSInteger )pageNumber Success:(void(^)(NSMutableArray * dataArr))success failure:(void(^)())failure;


@end
