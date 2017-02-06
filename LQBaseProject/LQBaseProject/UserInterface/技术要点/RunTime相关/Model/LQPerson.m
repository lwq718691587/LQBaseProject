//
//  LQPerson.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/6.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQPerson.h"
#import <objc/runtime.h>
#import "LQCanJumpPeople.h"

@implementation LQPerson





int eat (id self,SEL sel,NSString *str){

    return 100;
}

// 当一个对象调用未实现的方法，会调用这个方法处理,并且会把对应的方法列表传过来.
// 刚好可以用来判断，未实现的方法是不是我们想要动态添加的方法
+(BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(myEat:)) {
        // 第一个参数：给哪个类添加方法
        // 第二个参数：添加方法的方法编号
        // 第三个参数：添加方法的函数实现（函数地址）
        // 第四个参数：函数的类型，(返回值+参数类型) v:void @:对象->self :表示SEL->_cmd
        class_addMethod(self, sel, (IMP)eat, "i@:@");
    }
    return  [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    if (aSelector == @selector(peopleJump)) {
        LQCanJumpPeople * jumpPeople = [LQCanJumpPeople new];
        return jumpPeople;
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
