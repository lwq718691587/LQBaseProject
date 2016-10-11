//
//  UserEntity.h
//  NARUTO
//
//  Created by 刘伟强 on 15/4/18.
//  Copyright (c) 2015年 刘伟强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PeakSqlite.h"
@interface UserEntity : PeakSqlite

//主键ID 用户ID
@property (nonatomic) NSInteger ID;
//用户名
@property (nonatomic, copy) NSString *userName;
//用户密码
@property (nonatomic, copy) NSString *userPassword;
//创建时间
@property (nonatomic, strong) NSDate *timestamp;
//状态，是否完成
@property (nonatomic) BOOL done;

//返回字段名称
+(NSString *) ID;
+(NSString *) userName;
+(NSString *) userPassword;
+(NSString *) timestamp;
+(NSString *) done;

@end
