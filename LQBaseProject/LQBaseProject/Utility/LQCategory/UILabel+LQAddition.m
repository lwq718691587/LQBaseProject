//
//  UILabel+LQAddition.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "UILabel+LQAddition.h"
#import "NSString+LQAddition.h"
@implementation UILabel (LQAddition)

-(void)LQLabelAutoHeightWith:(NSInteger)spacing{
    self.numberOfLines = 0;
    self.attributedText = [self.text getSpaceStr:spacing];
    [self sizeToFit];
    
}

@end
