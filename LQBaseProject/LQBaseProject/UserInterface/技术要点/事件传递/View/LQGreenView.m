//
//  LQGreenView.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/11/1.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQGreenView.h"

@implementation LQGreenView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"Green - %@",[[super hitTest:point withEvent:event] class]);
    return [super hitTest:point withEvent:event];
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    
//    NSLog(@"%@",[super pointInside:point withEvent:event]?@"Green-YES":@"Green-NO");
//    return  [super pointInside:point withEvent:event];
//}

@end
