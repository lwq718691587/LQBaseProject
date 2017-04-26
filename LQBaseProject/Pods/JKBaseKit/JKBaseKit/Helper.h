//
//  Helper.h
//  HospitalRrepresentative
//
//  Created by lijiawei on 2017/3/10.
//  Copyright © 2017年 lijiawei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject

/**
 *@brief 根据字符串获取label的宽度
 *@param labelString label的text
 *@param fontsize label的字体大小，以systemFont为标准
 *@param width 最大宽度
 *@param height 最大高度
 */
+ (CGFloat)widthForLabelWithString:(NSString *)labelString withFontSize:(CGFloat)fontsize withWidth:(CGFloat)width withHeight:(CGFloat)height;

//根据text获取label的高度
+ (CGFloat)heightForLabelWithString:(NSString *)labelString withFontSize:(CGFloat)fontsize withWidth:(CGFloat)width withHeight:(CGFloat)height;

+ (NSString *)getTimeStrFromeTimeStamp:(NSInteger )time dataFormat:(NSString *)data;


/**
 转换单位

 @param balanceStr 分单位的字符串
 @return 元单位的字符串
 */
+ (NSString *)getBalanceStrFromeIntnetStr:(NSString *)balanceStr;

/**
 字典转json串

 @param dic <#dic description#>
 @return <#return value description#>
 */
+ (NSString *)jsonStrWith:(NSDictionary *)dic;

/**
 判断字符串长度 是否大于0 里面 判断 当前字符串 是NSString类型
 
 @return bool
 */
+ (BOOL)isLengthMoreThanZero:(NSString * )str;

@end
