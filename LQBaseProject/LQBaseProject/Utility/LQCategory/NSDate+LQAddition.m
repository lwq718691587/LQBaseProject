//
//  NSDate+LQAddition.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "NSDate+LQAddition.h"

@implementation NSDate (LQAddition)

+(BOOL)isTodayForTimervalSince1970:(NSTimeInterval)interval
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    return [[NSDate date] daysIntervalSinceDate:date];
}

- (NSInteger)daysIntervalSinceDate:(NSDate *)date
{
    NSInteger secondsOfSelf = (NSUInteger)[self timeIntervalSince1970];
    NSInteger secondOfDawn_self  = secondsOfSelf - secondsOfSelf % (3600 * 24);//self 00:00:00的时间戳
    
    NSInteger secondsOfDate = (NSInteger)[date timeIntervalSince1970];
    NSInteger secondOfDawn_date  = secondsOfDate - secondsOfDate % (3600 * 24);//date 00:00:00的时间戳
    
    NSInteger secondsInterval = labs(secondOfDawn_date - secondOfDawn_self);
    NSInteger daysInterval = secondsInterval / (3600 * 24);
    return daysInterval;
    //    return [NSDate daysIntervalForTimestamp:secondOfDawn_date sinceTimestamp:secondOfDawn_self];
}

+(NSInteger)daysIntervalForTimestamp:(NSTimeInterval)timestamp_d
                      sinceTimestamp:(NSTimeInterval)anotherTimestamp_d
{
    NSUInteger timestamp = (NSUInteger)timestamp_d;
    timestamp  = timestamp - timestamp % (3600 * 24);//第一个 00:00:00的时间戳
    
    NSUInteger anotherTimestamp = (NSUInteger)anotherTimestamp_d;
    anotherTimestamp  = anotherTimestamp - anotherTimestamp % (3600 * 24);//第一个 00:00:00的时间戳
    //计算timestamp_d距离anotherTimestamp_d的天数
    NSInteger dayInterval = (timestamp - anotherTimestamp) / (3600 * 24);
    return dayInterval;
}



@end
