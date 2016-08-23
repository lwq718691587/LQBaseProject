//
//  LQFullscreenImageViewController.h
//  刘伟强
//
//  Created by  刘伟强 Wu on 6/5/12.
//  Copyright (c) 2015 TFM. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LQFullscreenImageViewController : UIViewController

@property (nonatomic, retain) UIImageView *liftedImageView;
@property (nonatomic,assign)  UIViewContentMode cusContentMode ;
@property (nonatomic, assign) UIInterfaceOrientationMask supportedOrientations;

@end
