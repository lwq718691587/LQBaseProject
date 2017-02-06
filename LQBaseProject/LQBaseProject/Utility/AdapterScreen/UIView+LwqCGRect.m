//
//  UIView+LwqCGRect.m
//  123
//
//  Created by 刘伟强 on 15/7/31.
//  Copyright (c) 2015年 刘伟强. All rights reserved.
//

#import "UIView+LwqCGRect.h"

@implementation UIView (LwqCGRect)

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}
- (CGFloat)screenX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.left;
    }
    return x;
}

- (CGFloat)screenY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.top;
    }
    return y;
}

- (CGFloat)screenViewX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.left;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    
    return x;
}

- (CGFloat)screenViewY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.top;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}

- (CGRect)screenFrame {
    return CGRectMake(self.screenViewX, self.screenViewY, self.width, self.height);
}

- (CGPoint)offsetFromView:(UIView*)otherView {
    CGFloat x = 0, y = 0;
    for (UIView* view = self; view && view != otherView; view = view.superview) {
        x += view.left;
        y += view.top;
    }
    return CGPointMake(x, y);
}


- (CGPoint)centerOfFrame {
    CGRect rect = self.frame;
    return CGPointMake(rect.origin.x + rect.size.width / 2.0f,
                       rect.origin.y + rect.size.height / 2.0f);
}

- (CGPoint)centerOfBounds {
    CGRect rect = self.bounds;
    return CGPointMake(rect.origin.x + rect.size.width / 2.0f,
                       rect.origin.y + rect.size.height / 2.0f);
}
- (void)removeSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

+ (id)viewWithNib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}


+ (CGFloat)factorForiPhone5Width{
    return (CGFloat)320 / 375;
}
+ (CGFloat)factorForiPhone6PWidth{
    return (CGFloat)414 / 375;
}
+ (CGFloat)factorForiPhone6Width{
    return 1;
}
+ (CGFloat)factorForiPadWidth{
    return (CGFloat)768 / 375;
}
+ (CGFloat)Fxw:(CGFloat)xw{
    switch ((NSInteger)[UIScreen mainScreen].bounds.size.width) {
        case 320:
            return [self factorForiPhone5Width] * xw;
        case 375:
            return [self factorForiPhone6Width]* xw;
        case 414:
            return [self factorForiPhone6PWidth]* xw;
        case 768:
            return [self factorForiPadWidth]* xw;
        default:
            return [self factorForiPhone6Width]* xw;
    }
}

+ (CGFloat)factorForiPhone5Height{
    return (CGFloat)568 / 667;
}
+ (CGFloat)factorForiPhone6PHeight{
    return (CGFloat)736 / 667;
}
+ (CGFloat)factorForiPhone6Height{
    return 1;
}
+ (CGFloat)factorForiPhone4sHeight{
    return (CGFloat)480 / 667;
    
}
+ (CGFloat)factorForiPadHeight{
    return (CGFloat)1024 / 667;
    
}
+ (CGFloat)Fyh:(CGFloat)yh{
    switch ((NSInteger)[UIScreen mainScreen].bounds.size.height) {
        case 568:
            return [self factorForiPhone5Height]*yh;
            break;
        case 667:
            return [self factorForiPhone6Height]*yh;
        case 736:
            return [self factorForiPhone6PHeight]*yh;
        case 1024:
            return [self factorForiPadHeight]* yh;
        default:
            return [self factorForiPhone5Height]*yh;
    }
}

//键盘的弹出和收起
/*
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

- (void)keyboardWillShow:(NSNotification*)notification{
    
    CGFloat time = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    NSDictionary *userInfo = [notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    [UIView animateWithDuration:time  animations:^{
        self.view.frame = CGRectMake(0 ,-height+64, self.view.frame.size.width, self.view.frame.size.height);
    }];
}
- (void)keyboardWillHide:(NSNotification*)notification{
    
    CGFloat time = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:time  animations:^{
        //        self.sendContentView.center = CGPointMake(self.sendContentView.center.x, ScreenHeight - self.sendContentView.bounds.size.height / 2);
        self.view.frame = CGRectMake(self.view.frame.origin.x , 64, self.view.frame.size.width, self.view.frame.size.height);
        
    }];
}
 */
@end
