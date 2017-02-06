//
//  LQYellowView.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/11/1.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQYellowView.h"

@implementation LQYellowView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    
    CGRect rect = CGRectMake(146/2, 12/2, 46, 30/2);
    if (CGRectContainsPoint(rect, point)) {
        return self.subviews.lastObject.subviews.lastObject;
    }else{
        return [super hitTest:point withEvent:event];
    }
}

@end
