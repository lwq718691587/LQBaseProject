//
//  LQGestureRecongnizerViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2016/11/2.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQGestureRecongnizerViewController.h"

@interface LQGestureRecongnizerViewController ()
@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation LQGestureRecongnizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panFun:)];
    [self.myView addGestureRecognizer:pan];
    
    UIPinchGestureRecognizer * pin = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinFun:)];
    [self.myView addGestureRecognizer:pin];
    
    
    UIRotationGestureRecognizer * rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationFun:)];
    [self.myView addGestureRecognizer:rotation];
}

-(void)panFun:(UIPanGestureRecognizer *)recognizer{
    
     CGPoint center = recognizer.view.center;
     CGPoint translation = [recognizer translationInView:self.view];
     recognizer.view.center = CGPointMake(center.x + translation.x, center.y + translation.y);
     [recognizer setTranslation:CGPointZero inView:self.view];
    
}
-(void)pinFun:(UIPinchGestureRecognizer *)pin{
    CGFloat scale = pin.scale;
    pin.view.transform = CGAffineTransformScale(pin.view.transform, scale, scale);
    pin.scale = 1;
}

-(void)rotationFun:(UIRotationGestureRecognizer*)rotation{
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    rotation.rotation = 0.0;
}

@end
