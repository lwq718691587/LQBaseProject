//
//  LQDeveloperUtilityModel.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/10/12.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "BaseModel.h"

@interface LQDeveloperUtilityModel : BaseModel

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *url;

+(NSMutableArray*)getdataArr;

@end
