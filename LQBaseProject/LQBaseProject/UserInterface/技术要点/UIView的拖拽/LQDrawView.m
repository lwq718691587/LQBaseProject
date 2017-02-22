//
//  LQDrawView.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2017/2/20.
//  Copyright © 2017年 刘伟强. All rights reserved.
//

#import "LQDrawView.h"

@implementation LQDrawView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    UITouch * touch = [touches anyObject];
    CGPoint curP = [touch locationInView:self];
    NSLog(@"%f---%f",curP.x,curP.y);
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [super touchesMoved:touches withEvent:event];
    
    UITouch * touch = [touches anyObject];
    
    CGPoint curP = [touch locationInView:self];
    
    CGPoint preP = [touch previousLocationInView:self];
    
    CGFloat offSetX = curP.x - preP.x;
    
    CGFloat offSetY = curP.y - preP.y;

    self.transform = CGAffineTransformTranslate(self.transform, offSetX , offSetY);
    
}

@end
