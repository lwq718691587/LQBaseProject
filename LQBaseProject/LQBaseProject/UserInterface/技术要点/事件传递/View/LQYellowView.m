//
//  LQYellowView.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/11/1.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQYellowView.h"

@implementation LQYellowView


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    NSLog(@"Yellow - %@",[[super hitTest:point withEvent:event] class]);
    return [super hitTest:point withEvent:event];
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    
//    NSLog(@"%@",[super pointInside:point withEvent:event]?@"Yellow-YES":@"Yellow-NO");
//    return  [super pointInside:point withEvent:event];
//}

@end
