//
//  LQCGContextReftVIew.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/9/27.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQCGContextReftVIew.h"

@implementation LQCGContextReftVIew


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 1, 0.4, 1.0, 1.0);
    CGContextSetLineWidth(context, 2.0);
    CGContextAddRect(context, CGRectMake(2, 2, 270, 270));
    CGContextStrokePath(context);
    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextTranslateCTM(ctx, 0.0f, self.bounds.size.height);
//    CGContextScaleCTM(ctx, 1.0f, -1.0f);
//    UIGraphicsPushContext(ctx);
//    CGContextSetLineWidth(ctx,320);
//    CGContextSetRGBStrokeColor(ctx, 250.0/255, 250.0/255, 210.0/255, 1.0);
//    CGContextStrokeRect(ctx, CGRectMake(0, 0, 320, 460));
//    UIGraphicsPopContext();
    
}


@end
