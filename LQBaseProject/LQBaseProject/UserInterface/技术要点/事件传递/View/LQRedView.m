//
//  LQRedView.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/11/1.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQRedView.h"
#import "LQMacro.h"
@implementation LQRedView


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.layer.cornerRadius = self.height/2;
    }
    return self;
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    
    UIBezierPath * radiusPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 128, 128) cornerRadius:64];
    
    return [radiusPath containsPoint:point];
}

@end
