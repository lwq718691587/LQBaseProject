//
//  UmengUtility.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/23.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "UmengUtility.h"
#import <UMSocialWechatHandler.h>
#import <UMSocialQQHandler.h>
#import <UMSocialSinaSSOHandler.h>

@implementation UmengUtility


//配置umeng统计 和 umeng分享
+(void)collocateUmengStatistics{
    //Umeng统计ID
    UMConfigInstance.appKey = UmengAppkey;
    //渠道ID
    UMConfigInstance.channelId = ChannelId;
    //设置版本号为版本标识
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];
    //设置日志加密
    [MobClick setEncryptEnabled:YES];
    [MobClick startWithConfigure:UMConfigInstance];
    

    
}
+(void)collocateUmengShare{
    //umeng分享
    [UMSocialData setAppKey:UmengAppkey];
  
    [UMSocialWechatHandler setWXAppId:OracleenWeChatAppID
                            appSecret:OracleenWeChatAppSecret
                                  url:OracleenRedirectURL];
    
    [UMSocialQQHandler setQQWithAppId:OracleenQQAppID
                               appKey:OracleenQQAppKey
                                  url:@"OracleenRedirectURL"];
    [UMSocialSinaSSOHandler openNewSinaSSOWithRedirectURL:OracleenRedirectURL];
//    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3921700954"
//                                              secret:@"04b48b094faeb16683c32669824ebdad"
//                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
}
@end
