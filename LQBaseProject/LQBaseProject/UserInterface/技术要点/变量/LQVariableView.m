//
//  LQVariableView.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2017/1/12.
//  Copyright © 2017年 刘伟强. All rights reserved.
//

#import "LQVariableView.h"
//#import "LQVar.h"
//全局变量 可以在其他文件中使用
//可修改
NSInteger lwqAge = 10;
//不可修改
const NSInteger lwqAge2 = 20;

//1、静态变量
//static
//什么是静态变量：从面向对象的角度触发，当需要一个数据对象为整类而非某个对象服务，同时有力求不破坏类的封装性，既要求此成员隐藏在类的内部，有要求对外不可见的时候，就可以使用static。
//静态全局变量 只能在本文件中使用
static NSString *lwqName = @"lwq";

static const NSString *lwqName_static = @"lwq";


int varAge = 10;

@implementation LQVariableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"%ld",lwqAge);
        
        lwqName = @"lwq 修改";
        NSLog(@"%@",lwqName);
        
        for (int i = 0; i < 4; i++) {
            [self addcount];
        }
        for (int i = 0; i < 4; i++) {
            [self addcount_static];
        }
        
        extern int varAge;
//        varAge = 10;
        NSLog(@"varAge: %d",varAge);
    }
    return self;
}

- (void)addcount{
    int count = 100;
    count++;
    NSLog(@"普通变量的值： %d",count);
}

- (void)addcount_static{
    static int count = 100;
    count++;
    NSLog(@"静态变量的值： %d",count);
}

- (NSString *)description{
    return [NSString stringWithFormat:@"%@ +++++ %@",[super description],@"描述"];
    
    

    
}


@end
