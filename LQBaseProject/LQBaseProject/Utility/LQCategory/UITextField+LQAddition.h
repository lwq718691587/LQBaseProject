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
- (BOOL)phoneSubsectionAndTestsShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
/**
 *  限制textfield输入字符的长度，
 *
 *  @param length 6代表6个字母 或 3个汉字
 */
- (void)limitTextLength:(int)length;
@end
