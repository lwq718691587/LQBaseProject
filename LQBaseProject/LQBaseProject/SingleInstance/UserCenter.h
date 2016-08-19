//
//  UserCenter.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserCenter : NSObject

/**
 *  单例
 *
 *  @return 单例
 */
+(UserCenter *)sharedInstance;
//用户id
@property (copy, nonatomic  ) NSString   *userID;
//手机号
@property (copy, nonatomic  ) NSString   *userPhone;
//密码
@property (copy, nonatomic  ) NSString   *userPasswordMD5;
//用户名
@property (copy, nonatomic  ) NSString   *userNickName;
//性别
@property (copy, nonatomic  ) NSString   *userGender;
//头像地址
@property (copy, nonatomic  ) NSString   *userPortraitImageURLString;
//生日
@property (copy, nonatomic  ) NSString   *userBirthDay;
//联系方式
@property (copy, nonatomic  ) NSString   *userTelphone;

@end
