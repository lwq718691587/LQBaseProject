//
//  LQCustomLayer.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/12/7.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQCustomLayer.h"
#import <UIKit/UIKit.h>
@implementation LQCustomLayer


-(void)drawInContext:(CGContextRef)ctx{
    
    UIGraphicsPushContext(ctx);
    UIBezierPath* starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint: CGPointMake(35.75, 0.5)];
    [starPath addLineToPoint: CGPointMake(48.53, 19.15)];
    [starPath addLineToPoint: CGPointMake(70.23, 25.55)];
    [starPath addLineToPoint: CGPointMake(56.44, 43.47)];
    [starPath addLineToPoint: CGPointMake(57.06, 66.08)];
    [starPath addLineToPoint: CGPointMake(35.75, 58.5)];
    [starPath addLineToPoint: CGPointMake(14.44, 66.08)];
    [starPath addLineToPoint: CGPointMake(15.06, 43.47)];
    [starPath addLineToPoint: CGPointMake(1.27, 25.55)];
    [starPath addLineToPoint: CGPointMake(22.97, 19.15)];
    [starPath closePath];
    [UIColor.grayColor setFill];
    [starPath fill];
    UIGraphicsPopContext();
 
}

@end
