//
//  LQPinkView.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/11/2.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQPinkView.h"

@implementation LQPinkView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    NSLog(@"pink - %@",[[super hitTest:point withEvent:event] class]);
    return [super hitTest:point withEvent:event];
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    
//    NSLog(@"%@",[super pointInside:point withEvent:event]?@"Pink-YES":@"Pink-NO");
//    return  [super pointInside:point withEvent:event];
//}
@end
