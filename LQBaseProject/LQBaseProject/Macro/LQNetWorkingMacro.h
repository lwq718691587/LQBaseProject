//
//  LQNetWorkingMacro.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/18.
//  Copyright © 2016年 刘伟强. All rights reserved.

//网络相关宏定义

#ifndef LQNetWorkingMacro_h
#define LQNetWorkingMacro_h

#ifdef TestServerOpen
    #define MainServerUrl           @"https://www.baidu.com"
#else
    #define MainServerUrl          @"https://www.baidu.com"
#endif

//网络请求超时 时间
#define NetworkTimeoutInterval  10


//登录url
#define  LoginUrl(account,passWord)       [NSString stringWithFormat:@"%@/%@%@",MainServerUrl,account,passWord]
//注册url
#define  RegisterUrl(account,passWord)    [NSString stringWithFormat:@"%@/%@%@",MainServerUrl,account,passWord]



#endif /* LQNetWorkingMacro_h */
