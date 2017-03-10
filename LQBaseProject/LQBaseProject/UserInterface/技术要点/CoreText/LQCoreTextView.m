//
//  LQCoreTextView.m
//  LQBaseProject
//
//  Created by 刘伟强 on 2017/3/10.
//  Copyright © 2017年 刘伟强. All rights reserved.
//

#import "LQCoreTextView.h"
#import <CoreText/CoreText.h>
@implementation LQCoreTextView




- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.height);
    CGContextScaleCTM(context, 1, -1);
    //1.创建绘制区域,显示的区域可以用CGMUtablePathRef生成任意的形状
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, -10, ScreenWidth, ScreenWidth-10));
     //2.创建需要绘制的文字
    NSMutableAttributedString * attString = [[NSMutableAttributedString alloc]initWithString:@"When I will learn CoreText, i think it will hard for me.But it is easy.\n\tIn fact,if you bengin learn, you can know that every thing is easy when you start.you just need some knowlages"];
    //1设置部分文字颜色
    [attString addAttribute:(id)kCTForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0 , 27)];
    //2设置部分文字字体
    CGFloat fontSize = 20;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", fontSize, NULL);
    [attString addAttribute:(id)kCTFontAttributeName value:(__bridge id)fontRef range:NSMakeRange(0, 27)];
    //3设置斜体
    CTFontRef italicFontRef = CTFontCreateWithName((CFStringRef)[UIFont italicSystemFontOfSize:20].fontName, 16, NULL);
    [attString addAttribute:(id)kCTFontAttributeName value:(__bridge id)italicFontRef range:NSMakeRange(27, 9)];
    //4设置下划线
    [attString addAttribute:(id)kCTUnderlineStyleAttributeName value:(id)[NSNumber numberWithInteger:kCTUnderlineStyleDouble] range:NSMakeRange(36, 10)];
    //5设置下划线颜色
    [attString addAttribute:(id)kCTUnderlineColorAttributeName value:(id)[UIColor greenColor].CGColor range:NSMakeRange(36, 10)];
    //6设置空心字
    long number1 = 2;
    CFNumberRef numRef = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number1);
    [attString addAttribute:(id)kCTStrokeWidthAttributeName value:(__bridge id)numRef range:NSMakeRange(56, 10)];
    //7设置字体间距
    long number = 10;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
    [attString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(40, 10)];
    //8设置行间距
    CGFloat lineSpacing = 10;
    const CFIndex kNumberOfSettings = 3;
    CTParagraphStyleSetting theSettings[kNumberOfSettings] = {
        {kCTParagraphStyleSpecifierLineSpacingAdjustment, sizeof(CGFloat), &lineSpacing},
        {kCTParagraphStyleSpecifierMaximumLineHeight, sizeof(CGFloat), &lineSpacing},
        {kCTParagraphStyleSpecifierMinimumLineHeight, sizeof(CGFloat), &lineSpacing}
    };
    CTParagraphStyleRef theParagraphRef = CTParagraphStyleCreate(theSettings, kNumberOfSettings);
    [attString addAttribute:(id)kCTParagraphStyleAttributeName value:(__bridge id)theParagraphRef range:NSMakeRange(0, [attString length])];
    
    //3.根据AttString生成CTFramesetterRef
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, [attString length]), path, NULL);
    
    CTFrameDraw(frame, context);
}

@end
