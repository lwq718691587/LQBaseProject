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

#define LQQQAppID          @"11046452"
#define LQQQAppKey         @"HCVNo05vBnwjm"

#define LQWeChatAppID      @"wx5d5c508a4fb375"
#define OracleenWeChatAppSecret  @"bac18a7b8c02e70b774eeff711010"

#define LQFacebookAppID    @"8287359471767"

//回调地址
#define LQRedirectURL      @"http://www.oracleen.com"

@interface UmengUtility : NSObject

//配置umeng 统计
+(void)collocateUmengStatistics;
//配置umeng分享
+(void)collocateUmengShare;
@end
