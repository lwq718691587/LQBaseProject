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
    #define MainServerUrl          @"http://www.tngou.net"
#endif

//网络请求超时 时间
#define NetworkTimeoutInterval  10


//登录url
#define  LoginUrl(account,passWord)       [NSString stringWithFormat:@"%@/%@%@",MainServerUrl,account,passWord]
//注册url
#define  RegisterUrl(account,passWord)    [NSString stringWithFormat:@"%@/%@%@",MainServerUrl,account,passWord]
//图片地址 
#define  imageListUrl(pn,type)                 [NSString stringWithFormat:@"http://image.baidu.com/channel/listjson?pn=%ld&rn=30&tag1=美女&tag2=%@&ie=utf88",pn*30,type]

#define  imageListUrlNoPageNumber                 [NSString stringWithFormat:@"http://image.baidu.com/channel/listjson?pn=1&rn=100&tag1=动漫&tag2=火影忍者&ie=utf88"]

#endif /* LQNetWorkingMacro_h */
