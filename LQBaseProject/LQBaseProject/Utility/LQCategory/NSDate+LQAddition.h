//
//  NSDate+LQAddition.h
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LQAddition)

/**
 *  是否是今天
 *
 *  @param interval 给定的时间戳
 *
 *  @return YES or NO
 */
+(BOOL)isTodayForTimervalSince1970:(NSTimeInterval)interval;
/**
 *  两个日期之间的天数间隔
 *
 *  @param date 时间
 *
 *  @return 天数间隔
 */
- (NSInteger)daysIntervalSinceDate:(NSDate *)date;
/**
 *  计算两个时间戳之间的天数间隔
 *
 *  @param timestamp_d        时间戳
 *  @param anotherTimestamp_d 开始的时间戳
 *
 *  @return 天数
 */
+(NSInteger)daysIntervalForTimestamp:(NSTimeInterval)timestamp_d
                      sinceTimestamp:(NSTimeInterval)anotherTimestamp_d;

@end
