//
//  UIButton+LQAddition.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LQAddition)
/**
 *  调整btn的 image与title的位置
 *
 *  @param spacing 
 */
- (void)makeLeftImageRightTitle:(CGFloat)spacing;
- (void)makeLeftTitleRightImage:(CGFloat)spacing;
- (void)makeTopImageBottomTitle:(CGFloat)spacing;
- (void)makeTopTitleBottomImage:(CGFloat)spacing;
@end
