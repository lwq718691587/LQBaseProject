//
//  UIView+LwqCGRect.h
//  123
//
//  Created by 刘伟强 on 15/7/31.
//  Copyright (c) 2015年 刘伟强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LwqCGRect)

/**
 *  返回UIView及其子类的位置和尺寸。分别为左、右边界在X轴方向上的距离，上、下边界在Y轴上的距离，View的宽和高。
 */
@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat bottom;
@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;
@property(nonatomic) CGFloat centerX;
@property(nonatomic) CGFloat centerY;

@property(nonatomic,readonly) CGFloat screenX;
@property(nonatomic,readonly) CGFloat screenY;
@property(nonatomic,readonly) CGFloat screenViewX;
@property(nonatomic,readonly) CGFloat screenViewY;
@property(nonatomic,readonly) CGRect screenFrame;

- (void)removeSubviews;
- (CGPoint)centerOfFrame;
- (CGPoint)centerOfBounds;

+ (id)viewWithNib;

+ (CGFloat)Fyh:(CGFloat)yh;
+ (CGFloat)Fxw:(CGFloat)xw;


@end
