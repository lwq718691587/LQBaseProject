//
//  UIButton+LQAddition.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "UIButton+LQAddition.h"

@implementation UIButton (LQAddition)

- (void)makeLeftImageRightTitle:(CGFloat)spacing{
    
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing, 0,0);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -spacing);
}
- (void)makeLeftTitleRightImage:(CGFloat)spacing{
    /**
     *  先获取imageView的 宽度 才能获取titleLabel的宽度
     */
    CGFloat imageWidth = self.imageView.frame.size.width;
    CGFloat titleWidth = CGRectGetWidth(self.titleLabel.layer.frame);
    self.titleEdgeInsets = UIEdgeInsetsMake(0,- (imageWidth + spacing),0, imageWidth + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth + spacing , 0,- (titleWidth + spacing));
}
- (void)makeTopImageBottomTitle:(CGFloat)spacing{
    
    CGFloat imageHeight =  self.imageView.frame.size.height;
    CGFloat imageWidth = self.imageView.frame.size.width;
    
    CGFloat titleHeight = self.titleLabel.frame.size.height;
    CGFloat titleWidth = self.titleLabel.frame.size.width;
    
    CGFloat totalHeight = imageHeight + titleHeight + spacing;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(imageHeight - totalHeight, 0.0, 0.0,0 - titleWidth);
    self.titleEdgeInsets = UIEdgeInsetsMake(0,0 - imageWidth,titleHeight - totalHeight, 0.0);
}
- (void)makeTopTitleBottomImage:(CGFloat)spacing{
    CGFloat imageHeight =  self.imageView.frame.size.height;
    CGFloat imageWidth = self.imageView.frame.size.width;
    
    CGFloat titleHeight = self.titleLabel.frame.size.height;
    CGFloat titleWidth = self.titleLabel.frame.size.width;
    
    CGFloat totalHeight = imageHeight + titleHeight + spacing;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0,0,imageHeight - totalHeight,0 - titleWidth);
    self.titleEdgeInsets = UIEdgeInsetsMake(titleHeight - totalHeight,0 - imageWidth, 0.0, 0.0);
}

@end
