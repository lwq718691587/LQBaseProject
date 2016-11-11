//
//  LQBlueView.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/11/1.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQBlueView.h"

@implementation LQBlueView





-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    
    CGRect rect = CGRectMake(0, 0, self.width, self.height);
    NSLog(@"%@",NSStringFromCGRect(rect));
    return CGRectContainsPoint(rect, point);
}

@end
