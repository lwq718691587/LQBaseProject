//
//  LQFunction.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2017/3/10.
//  Copyright © 2017年 刘伟强. All rights reserved.
//

#import "LQFunction.h"


#import "LQDveloperUtilityViewController.h"
#import "LQMultithreading_NSThreadViewController.h"
#import "LQMultithreading_NSOperationViewController.h"
#import "LQMultithreading_GCDViewController.h"
#import "LQCountViewController.h"
#import "LQScreenViewController.h"
#import "LQRunTimeViewController.h"
#import "LQlgorithmViewController.h"
#import "LQKVC_KVOViewController.h"
#import "LQCGContextRefViewController.h"
#import "LQGetLableHeightViewController.h"
#import "LQHttpViewController.h"
#import "LQSqliteViewController.h"
#import "LQSDLearnViewController.h"
#import "LQBlockViewController.h"
#import "LQResponderViewController.h"
#import "LQGestureRecongnizerViewController.h"
#import "LQTextImageViewController.h"
#import "LQLandscapeTableViewController.h"
#import "LQAutoreleasepoolViewController.h"
#import "LQCGViewController.h"
#import "LQKeychainViewController.h"
#import "LQVariableViewController.h"
#import "LQDrawViewController.h"
#import "LQMemoryViewController.h"
#import "LQCoreImageViewController.h"
#import "LQJSViewController.h"
#import "LQCoreTextViewController.h"

@implementation LQFunction


+ (NSArray *)getVcDataArr{
    return @[@"开发工具",@"多线程-NSThread",@"多线程-NSOperation",@"多线程-GCD",@"屏幕旋转",@"block内的self",@"runtime",@"简单的算法",@"KVC&KVO",@"CGContextRef",@"计算label的高度",@"网络请求",@"sqlite数据库",@"SDWebImage学习",@"block",@"事件传递",@"手势",@"富文本",@"tableviews上横向滑动",@"自动释放池",@"绘图",@"保存信息到钥匙串",@"修饰变量",@"view的拖拽",@"内存相关",@"CoreImage",@"原生与JS交互",@"Coretext学习"];
}

+ (UIViewController *)getVCofIndex:(NSInteger )index{
    UIViewController * vc ;
    switch (index) {
        case 0:
            vc = [[LQDveloperUtilityViewController alloc]init];
            break;
        case 1:
            vc = [[LQMultithreading_NSThreadViewController alloc]init];
            break;
        case 2:
            vc = [[LQMultithreading_NSOperationViewController alloc]init];
            break;
        case 3:
            vc = [[LQMultithreading_GCDViewController alloc]init];
            break;
        case 4:
            vc = [[LQScreenViewController alloc]init];
            break;
        case 5:
            vc = [[LQCountViewController alloc]init];
            break;
        case 6:
            vc = [[LQRunTimeViewController alloc]init];
            break;
        case 7:
            vc = [[LQlgorithmViewController alloc]init];
            break;
        case 8:
            vc = [[LQKVC_KVOViewController alloc]init];
            break;
        case 9:
            vc = [[LQCGContextRefViewController alloc]init];
            break;
        case 10:
            vc = [[LQGetLableHeightViewController alloc]init];
            break;
        case 11:
            vc = [[LQHttpViewController alloc]init];
            break;
        case 12:
            vc = [[LQSqliteViewController alloc]init];
            break;
        case 13:
            vc = [[LQSDLearnViewController alloc]init];
            break;
        case 14:
            vc = [[LQBlockViewController alloc]init];
            break;
        case 15:
            vc = [[LQResponderViewController alloc]init];
            break;
        case 16:
            vc = [[LQGestureRecongnizerViewController alloc]init];
            break;
        case 17:
            vc = [[LQTextImageViewController alloc]init];
            break;
        case 18:
            vc = [[LQLandscapeTableViewController alloc]init];
            break;
        case 19:
            vc = [[LQAutoreleasepoolViewController alloc]init];
            break;
        case 20:
            vc = [[LQCGViewController alloc] init];
            break;
        case 21:
            vc = [[LQKeychainViewController alloc]init];
            break;
        case 22:
            vc = [[LQVariableViewController alloc]init];
            break;
        case 23:
            vc = [[LQDrawViewController alloc]init];
            break;
        case 24:
            vc = [[LQMemoryViewController alloc]init];
            break;
        case 25:
            vc = [[LQCoreImageViewController alloc]init];
            break;
        case 26:
            vc = [[LQJSViewController alloc]init];
            break;
        case 27:
            vc = [[LQCoreTextViewController alloc]init];
            break;
        default:
            break;
    }
    return vc;
}

@end
