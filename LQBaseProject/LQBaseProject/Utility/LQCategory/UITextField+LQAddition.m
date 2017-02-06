//
//  UITextField+LQAddition.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/10/8.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "UITextField+LQAddition.h"
#import <objc/runtime.h>
@implementation UITextField (LQAddition)

- (BOOL)phoneSubsectionAndTestsShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSUInteger proposedNewLength = self.text.length - range.length + string.length;
    if (string.length>0) {
        NSMutableString *str=[NSMutableString stringWithString:self.text];
        while (self.text.length==3||self.text.length==8) {
            if (self.text.length==3) {
                [str insertString:@" " atIndex:3];
            }
            else if(self.text.length==8){
                [str insertString:@" " atIndex:8];
            }
            self.text = [NSString stringWithString:str];
        }
        NSLog(@"%@",self.text);
    }else if(string.length==0){
        NSMutableString *str=[NSMutableString stringWithString:self.text];
        while (self.text.length==5||self.text.length==10) {
            if (self.text.length==5) {
                [str deleteCharactersInRange:NSMakeRange(4, 1)];
            }
            else if(self.text.length==10){
                [str deleteCharactersInRange:NSMakeRange(9, 1)];
            }
            self.text = [NSString stringWithString:str];
        }
        NSLog(@"%@",self.text);
    }
    if (proposedNewLength > 13){
        return NO;//限制长度
    }else{
        return YES;
    }
}

static NSString *kLimitTextLengthKey = @"kLimitTextLengthKey";

- (void)limitTextLength:(int)length
{
    objc_setAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey), [NSNumber numberWithInt:length], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(textFieldTextLengthLimit:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldTextLengthLimit:(id)sender
{
    NSNumber *lengthNumber = objc_getAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey));
    int length = [lengthNumber intValue];
    if(self.text.length > length){
        self.text = [self.text substringToIndex:length];
    }
}



@end
