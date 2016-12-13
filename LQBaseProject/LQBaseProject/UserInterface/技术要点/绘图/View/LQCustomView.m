//
//  LQCustomView.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/12/7.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQCustomView.h"
#import "LQCustomLayer.h"

@interface LQCustomView ()

@property(nonatomic,strong)CADisplayLink *myDispalyLink;
@property (strong, nonatomic) NSTimer *myTimer;
@property (nonatomic) double Angle;
@end

@implementation LQCustomView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.Angle = 0;
        
//        self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1/60 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            [self setNeedsDisplay];
//        }];
//        self.myDispalyLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(animationStart)];
//        [self.myDispalyLink addToRunLoop:[NSRunLoop currentRunLoop]
//                                 forMode:NSRunLoopCommonModes];
    }
    return self;
}

-(void)animationStart{
//    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
    
    self.Angle += 0.001;
    if (self.Angle >= 5) {
        self.Angle = 0;
    }
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    if (self.Angle < 1) {
        [path moveToPoint:CGPointMake(175, 100)];
        [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI*self.Angle clockwise:YES];
    }else if (self.Angle < 2){
        [path moveToPoint:CGPointMake(175, 100)];
        [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
        [path moveToPoint:CGPointMake(150, 125)];
        [path addLineToPoint:CGPointMake(150, 125 + 50 * (self.Angle -1 ))];
    }else if (self.Angle < 3){
        [path moveToPoint:CGPointMake(175, 100)];
        [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
        [path moveToPoint:CGPointMake(150, 125)];
        [path addLineToPoint:CGPointMake(150, 125 + 50 )];
        
        [path addLineToPoint:CGPointMake(150 - 25 * (self.Angle - 2 ), 175 + 50 * (self.Angle - 2 ) )];
    }else if (self.Angle < 4){
        [path moveToPoint:CGPointMake(175, 100)];
        [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
        [path moveToPoint:CGPointMake(150, 125)];
        [path addLineToPoint:CGPointMake(150, 125 + 50 )];
        
        [path addLineToPoint:CGPointMake(150 - 25, 175 + 50 )];
        
        [path moveToPoint:CGPointMake(150, 175)];
        [path addLineToPoint:CGPointMake(150 + 25 * (self.Angle - 3 ), 175 + 50 * (self.Angle - 3 ))];
    }else if (self.Angle < 5){
        
        [path moveToPoint:CGPointMake(175, 100)];
        [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
        [path moveToPoint:CGPointMake(150, 125)];
        [path addLineToPoint:CGPointMake(150, 125 + 50 )];
        
        [path addLineToPoint:CGPointMake(150 - 25, 175 + 50 )];
        
        [path moveToPoint:CGPointMake(150, 175)];
        [path addLineToPoint:CGPointMake(150 + 25 , 175 + 50)];
        
        [path moveToPoint:CGPointMake(100, 150)];
        [path addLineToPoint:CGPointMake(100 + 100 * (self.Angle - 4 ) , 150)];
    }
    
 
    

    
 
    
  
    
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineWidth = 2;
    [[UIColor redColor] setStroke];
    [path stroke];
    
    
//    UIBezierPath *p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2, 2, 100, 100)];
//    p.lineWidth = 2;
//    [[UIColor redColor] setStroke];
//    [p stroke];
//    [[UIColor yellowColor] setFill];
//    [p fill];
 
//    self.Angle += 0.001;
//    if (self.Angle >= 1) {
//        self.Angle = 0;
//    }
//    CGContextRef con = UIGraphicsGetCurrentContext();
//    CGContextAddArc(con, 160, 50, 50, 0, 2*M_PI * self.Angle, 0);
//    CGContextSetLineWidth(con, 3);
//    CGContextSetStrokeColorWithColor(con,  [UIColor redColor].CGColor);
//    CGContextStrokePath(con);
}


@end
