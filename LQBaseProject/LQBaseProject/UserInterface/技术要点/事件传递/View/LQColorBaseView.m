//
//  LQColorBaseView.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/11/1.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQColorBaseView.h"



@implementation LQColorBaseView


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@---touchesBegan",[self class]);
}


//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    
//    
//    NSLog(@"%@+++%@",[self class],NSStringFromCGPoint(point));
//    
//    return [super hitTest:point withEvent:event];
//}
//-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    
//    NSString * value = [super pointInside:point withEvent:event] ?@"YES":@"NO";
//    NSLog(@"value ---- %@",value);
//    return [super pointInside:point withEvent:event];
//}

@end
