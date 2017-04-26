//
//  Helper.m
//  HospitalRrepresentative
//
//  Created by lijiawei on 2017/3/10.
//  Copyright © 2017年 lijiawei. All rights reserved.
//  刘伟强

#import "Helper.h"

@implementation Helper

+ (CGFloat)widthForLabelWithString:(NSString *)labelString withFontSize:(CGFloat)fontsize withWidth:(CGFloat)width withHeight:(CGFloat)height
{
    if(labelString.length == 0){
        return 0.0;
    }
    
    CGSize size = CGSizeMake(width, height);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:fontsize],NSFontAttributeName,nil];
    CGSize actualsize = [labelString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
    
    //得到的宽度为0，返回最大宽度
    if(actualsize.width == 0){
        return width;
    }
    return actualsize.width;
    
}
+ (CGFloat)heightForLabelWithString:(NSString *)labelString withFontSize:(CGFloat)fontsize withWidth:(CGFloat)width withHeight:(CGFloat)height {
    
    
    
    CGSize size = CGSizeMake(width, height);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:fontsize],NSFontAttributeName,nil];
    CGSize actualsize = [labelString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
    return actualsize.height;
}




+ (NSString *)getTimeStrFromeTimeStamp:(NSInteger )time dataFormat:(NSString *)data{
    NSTimeInterval interval = time / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:data];
    NSString * timeStr = [NSString stringWithFormat:@"%@",[objDateformat stringFromDate: date]];
    return timeStr;
}

+ (NSString *)getBalanceStrFromeIntnetStr:(NSString *)balanceStr{
    
    return [NSString stringWithFormat:@"%.2f",[balanceStr intValue]/100.f];
    
//    if (balanceStr.length < 2) {
//        return balanceStr;
//    }else{
//        NSString * str1 = [balanceStr substringWithRange:NSMakeRange(0, balanceStr.length - 2)];
//        NSString * str2 = [balanceStr substringWithRange:NSMakeRange(balanceStr.length - 2, 2)];
//        return [NSString stringWithFormat:@"%@.%@",str1,str2];
//    }
//}
}

+ (NSString *)jsonStrWith:(NSDictionary *)dic{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *jsonstr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonstr;
}


+(BOOL)isLengthMoreThanZero:(NSString *)str{
    if ([str isKindOfClass:[NSString class]]) {
        if ([str isEqualToString:@"<null>"] || [str isEqualToString:@"(null)"]) {
            return NO;
        }else{
            if (str.length > 0) {
                return YES;
            }else{
                return NO;
            }
        }
    }else{
        return NO;
    }
}

@end
