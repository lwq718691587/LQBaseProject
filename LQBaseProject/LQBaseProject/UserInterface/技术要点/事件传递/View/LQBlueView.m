//
//  LQBlueView.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/11/1.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQBlueView.h"

@implementation LQBlueView


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"Blue - %@",[[super hitTest:point withEvent:event] class]);
    return [super hitTest:point withEvent:event];
}


//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    
//    NSLog(@"%@",[super pointInside:point withEvent:event]?@"Blue-YES":@"Blue-NO");
//    return  [super pointInside:point withEvent:event];
//}

@end
