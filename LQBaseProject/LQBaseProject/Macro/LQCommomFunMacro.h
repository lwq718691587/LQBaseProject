//
//  LQCommomFunMacro.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/18.
//  Copyright © 2016年 刘伟强. All rights reserved.


// app常用宏定义

#ifndef LQCommomFunMacro_h
#define LQCommomFunMacro_h



/****************************************************************************/
//屏幕相关

#define ScreenWidth                             ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight                            ([UIScreen mainScreen].bounds.size.height)
#define KeyWindow                               [[UIApplication sharedApplication] keyWindow]

#define SFwx(width)                             [UIView Fxw:width]
#define SFhy(height)                            [UIView Fyh:height]
#define SFCGRect(x,y,w,h)                       CGRectMake(SFwx(x),SFhy(y),SFwx(w),SFhy(h))
#define SFCGPoint(x,y)                          CGPointMake(SFwx(x),SFhy(y))

#define StatusBarHeight                         (20.0f)
#define NavigationBarHeight                     (64.0f)
#define NavigationBarHeight_WithOutStatusBar    (44.0f)
#define TabBarHeight                            (49.0f)

/****************************************************************************/
//颜色相关 -- 更全面的 颜色宏 查看 ChameleonMacros.h 这个文件
#define HexColor(hexString)                     [UIColor colorWithHexString:hexString]
#define HexColorWithAlpha(hexString,alpha)      [UIColor colorWithHexString:hexString withAlpha:alpha]

#define RGBColor(r,g,b)                         RGBColorWithAlpha(r,g,b,1.00f)
#define RGBColorAlpha(r,g,b,alpha)              [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]

#define ColorWithAlpha(color,alpha)             [color colorWithAlphaComponent:alpha]

/****************************************************************************/
//设备 及 系统 判断
#define iPhone4S                                (([UIScreen mainScreen].bounds.size.height) == 480)
#define iPhone5S                                (([UIScreen mainScreen].bounds.size.height) == 568)
#define iPhone6And6s                            (([UIScreen mainScreen].bounds.size.height) == 667)
#define iPhone6PAnd6Ps                          (([UIScreen mainScreen].bounds.size.height) == 736)
#define iPhone5OrLater                          (([UIScreen mainScreen].bounds.size.height) >= 568)
#define iPhone6OrLater                          (([UIScreen mainScreen].bounds.size.height) >= 667)

#define iOS8OrLater                             [[[UIDevice currentDevice]systemVersion]floatValue] >= 8.0f
#define iOS7OrLater                             [[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0f
#define LessThaniOS7                            [[[UIDevice currentDevice]systemVersion]floatValue] <  7.0f
/****************************************************************************/
//便利 系统 方法

//便利存储
#define STORECENTER                             [NSUserDefaults standardUserDefaults]
#define SetNSUserDefaults(a,key)                [STORECENTER setObject:a forKey:key]
#define ValueNSUserDefaults(key)                [STORECENTER objectForKey:key]
//AppDelegate
#define LQAppDelegate                           ((AppDelegate*)[UIApplication sharedApplication].delegate)
/****************************************************************************/
//多语言
#define I18N(str)                               NSLocalizedStringFromTable(str, @"OCLanguages", nil)
/****************************************************************************/
//警告
#define Alert(msg)                              UIAlertView *alert_2015_10_19 = [[UIAlertView alloc] \
                                                initWithTitle:@"" message:msg delegate:nil \
                                                cancelButtonTitle:@"确定" otherButtonTitles:nil];\
                                                [alert_2015_10_19 show]

#endif /* LQCommomFunMacro_h */
