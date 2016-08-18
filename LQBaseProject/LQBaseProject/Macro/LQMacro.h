//
//  LQMacro.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/18.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#ifndef LQMacro_h
#define LQMacro_h

#import "LQAppInfoMacro.h"
#import "LQCommomFunMacro.h"
#import "LQNetWorkingMacro.h"

#warning read before AppStore 发布时要注释掉

#define AppDebugMode

#ifdef AppDebugMode
    #define AppTest        //测试开关,
    #define TestServerOpen //负责调整Debug模式下的服务器地址
#endif
/****************************************************************************/

#ifdef DEBUG
    #ifdef AppTest
        #define NSLog(...) NSLog(__VA_ARGS__)
    #else
        #define NSLog(...)
    #endif
#else
    #define NSLog(...)
#endif


#endif /* LQMacro_h */
