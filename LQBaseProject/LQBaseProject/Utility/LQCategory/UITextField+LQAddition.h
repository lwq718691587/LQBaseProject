//
//  UITextField+LQAddition.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/10/8.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LQAddition)


/** 手机号码分段 且不超过13位 */
-(BOOL)phoneSubsectionAndTestsShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

@end
