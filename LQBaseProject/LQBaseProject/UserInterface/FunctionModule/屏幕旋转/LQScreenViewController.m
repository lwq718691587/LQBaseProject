//
//  LQPersonInfoViewController.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/23.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "LQScreenViewController.h"
#import "LQFullscreenImageViewController.h"
#import "LQFullViewController.h"
#import "BaseNavigationViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface LQScreenViewController ()
@property (strong, nonatomic)  MPMoviePlayerController * mp;
@end

@implementation LQScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mp =[[MPMoviePlayerController alloc]initWithContentURL:[NSURL URLWithString:@"http://zs119s.brongnet.com/RAQxaFDFhUAc4sAtaEW8XN.mp4"]];
    self.mp.view.frame = CGRectMake(0, 20, ScreenWidth, 250);
    self.mp.controlStyle = MPMovieControlStyleEmbedded;
    self.mp.shouldAutoplay = YES;
    [self.view addSubview:self.mp.view];
    [self.mp play];
    
    UIButton * fullScreenBtn = [[UIButton alloc]initWithFrame:CGRectMake(300, 300, 100, 100)];
    fullScreenBtn.backgroundColor = FlatRed;
    [self.view addSubview:fullScreenBtn];
    [fullScreenBtn addTarget:self action:@selector(fullScreenBtnFun) forControlEvents:UIControlEventTouchDown];
    // Do any additional setup after loading the view.
}

-(void)fullScreenBtnFun{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    LQFullViewController * vc = [[LQFullViewController alloc]init];
    vc.mp = self.mp;
    BaseNavigationViewController * nvc = [[BaseNavigationViewController alloc]initWithRootViewController:vc];
    
    [self presentViewController:nvc animated:YES completion:nil];
}

#pragma mark 转屏方法 不允许转屏
-(BOOL)shouldAutorotate{
    return YES;
}
//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationLandscapeRight;
}

@end
