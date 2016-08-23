//
//  UmengUtility.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/23.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMMobClick/MobClick.h>
#import <UMSocial.h>


#define UmengAppkey              @"57bc08a5e0f55abc55000861"
#define ChannelId                @"TEST" //渠道ID


#define OracleenQQAppID          @"1104645213"
#define OracleenQQAppKey         @"HCVNo05vBnwjmWgP"

#define OracleenWeChatAppID      @"wx5d5c508a4fb371c5"
#define OracleenWeChatAppSecret  @"bac18a7b8c02e70b77d964eeff711010"

#define OracleenFacebookAppID    @"828735947175367"

//回调地址
#define OracleenRedirectURL      @"http://www.oracleen.com"

@interface UmengUtility : NSObject

//配置umeng 统计
+(void)collocateUmengStatistics;
//配置umeng分享
+(void)collocateUmengShare;
@end
