//
//  NSString+LQAddition.m
//  LQBaseProject
//
//  Created by 刘伟强 on 16/8/19.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "NSString+LQAddition.h"
#import <CommonCrypto/CommonDigest.h>
#define CC_MD5_DIGEST_LENGTH    16          /* digest length in bytes */

@implementation NSString (LQAddition)



- (NSMutableAttributedString *)getSpaceStr:(CGFloat)spacing{
    NSString * str = self;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    
    return attributedString;
}

- (NSString *)getTimeStrOfTimeStamp{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self intValue]];
    return  [date formattedDateWithFormat:@"YYYY-MM-dd HH:MM"];
}

- (NSData *)hexData
{
    Byte bytes[self.length / 2];
    for (int i=0,j=0; i < self.length; i++,j++) {
        unichar hex_char1 = [self characterAtIndex:i];
        int hex1;
        if (hex_char1 >= '0' && hex_char1 <= '9') {
            hex1 = (hex_char1 - 48) * 16;
        }else if (hex_char1 >= 'A' && hex_char1 <= 'F'){
            hex1 = (hex_char1 - 55) * 16;
        }else{
            hex1 = (hex_char1 - 87) * 16;
        }
        i++;
        unichar hex_char2 = [self characterAtIndex:i];
        int hex2;
        if (hex_char2 >= '0' && hex_char2 <= '9') {
            hex2 = hex_char2 - 48;
        }else if (hex_char2 >= 'A' && hex_char2 <= 'F'){
            hex2 = hex_char2 - 55;
        }else{
            hex2 = hex_char2 - 87;
        }
        bytes[j] = hex1 + hex2;
    }
    return [NSData dataWithBytes:&bytes length:sizeof(bytes)];
}

- (BOOL)containsString:(NSString *)string {
    if (string == nil) return NO;
    return [self rangeOfString:string].location != NSNotFound;
}

- (BOOL)isTelephoneNumber
{
    NSString * str = self;
    if ([self containsString:@" "]) {
        str = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"^1[3|4|5|7|8][0-9]\\d{8}$"];
    return [predicate evaluateWithObject:str];
}

- (BOOL)isVaildPasswordWithMoreThan6LessThan18NumbersOrLetters
{
    NSPredicate *perdicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"^[A-Za-z0-9]{6,18}$"];
    return [perdicate evaluateWithObject:self];
}

- (NSString *)getNOSpaceStr{
    NSString * phoneNumber = self;
    if ([self containsString:@" "]) {
        phoneNumber = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    return phoneNumber;
}


/**
 *  @brief  JSON字符串转成NSDictionary
 *
 *  @return NSDictionary
 */
- (NSDictionary *) dictionaryValue{
    NSError *errorJson;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&errorJson];
    if (errorJson != nil) {
#ifdef DEBUG
        NSLog(@"fail to get dictioanry from JSON: %@, error: %@", self, errorJson);
#endif
    }
    return jsonDict;
}


- (BOOL)isEmail
{
    NSString *emailRegEx = @"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";
    
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    return [regExPredicate evaluateWithObject:[self lowercaseString]];
}

- (NSString *)MD5
{
    if(self == nil || [self length] == 0)
        return nil;
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for(i=0;i<CC_MD5_DIGEST_LENGTH;i++)
    {
        [ms appendFormat: @"%02x", (int)(digest[i])];
    }
    return [ms copy];
}

@end
