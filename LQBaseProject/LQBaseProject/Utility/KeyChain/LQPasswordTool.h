//
//  LQPasswordTool.h
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/12/21.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQPasswordTool : NSObject


/**
 存储用户名和密码

 @param userName 用户名
 @param password 密码
 */
+ (void)saveUserName:(id)userName passWord:(id)password;


/**
 读取密码

 @return <#return value description#>
 */
+ (id)readPassWord;

/**
 读取用户名
 
 @return <#return value description#>
 */
+ (id)readUserName;


/**
 *    @brief    删除密码数据
 */
+ (void)deletePassWord;

@end
