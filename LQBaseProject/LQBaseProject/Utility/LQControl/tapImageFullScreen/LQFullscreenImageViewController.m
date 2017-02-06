//
//  LQFullscreenImageViewController.m
//  刘伟强
//
//  Created by  刘伟强 Wu on 6/5/12.
//  Copyright (c) 2015 TFM. All rights reserved.
//

#import "LQFullscreenImageViewController.h"
#import <QuartzCore/QuartzCore.h>

static const double kAnimationDuration = 0.3;

@interface LQFullscreenImageViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) CGRect startFrame;
@property (nonatomic, assign) UIInterfaceOrientation fromOrientation;
@property (nonatomic, assign) UIInterfaceOrientation toOrientation;

- (void)onDismiss;

@end

@implementation LQFullscreenImageViewController

- (id) init {
    self = [super init];
    if (self) {
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
    return self;
}

#pragma mark - View Life Cycle

- (void)viewDidLoad{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.view.backgroundColor = [UIColor blackColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.delegate = self;
    self.scrollView.maximumZoomScale = 2;
    self.scrollView.autoresizingMask = self.view.autoresizingMask;
    [self.view addSubview:self.scrollView];
    
    self.containerView = [[UIView alloc] initWithFrame:self.scrollView.bounds];
    self.containerView.autoresizingMask = self.view.autoresizingMask;
    [self.scrollView addSubview:self.containerView];
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.containerView.bounds];
    self.imageView.autoresizingMask = self.view.autoresizingMask;
    self.imageView.userInteractionEnabled = YES;
    self.imageView.clipsToBounds = YES;
    [self.containerView addSubview:self.imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onDismiss)];
    [self.view addGestureRecognizer:tap];;
}


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIApplication *app = [UIApplication sharedApplication];
    UIView *window = [app keyWindow];
  
    
    self.imageView.image = self.liftedImageView.image;
    self.imageView.contentMode = self.liftedImageView.contentMode;
    
    self.startFrame = [self.liftedImageView convertRect:self.liftedImageView.bounds toView:window];
    self.imageView.frame = self.startFrame;
    [window addSubview:self.imageView];
    
    UIImage * image = self.liftedImageView.image;
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.width * image.size.height / image.size.width);
    if (rect.size.height > self.view.frame.size.height) {
        rect = CGRectMake(0, 0, self.view.frame.size.height * image.size.width / image.size.height , self.view.frame.size.height );
    }
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.imageView.frame = rect;
        self.imageView.center = CGPointMake(self.containerView.frame.size.width/2, self.containerView.frame.size.height/2);
    }completion:^(BOOL finished) {
        [self.containerView addSubview:self.imageView];
          [app setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    }];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    UIApplication *app = [UIApplication sharedApplication];
    UIWindow *window = [app keyWindow];
    [app setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
    [window addSubview:self.imageView];
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.imageView.frame = self.startFrame;
    }completion:^(BOOL finished) {
        [self.imageView removeFromSuperview];
    }];
}
#pragma mark - Private Methods

- (void)onDismiss {
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
}
#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.containerView;
}

- (BOOL)shouldAutorotate{
    return NO;
}
//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
