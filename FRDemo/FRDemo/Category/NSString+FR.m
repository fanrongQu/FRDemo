//
//  NSString+FR.m
//  FRDemo
//
//  Created by 1860 on 16/1/5.
//  Copyright © 2016年 QuFanrong. All rights reserved.
//

#import "NSString+FR.h"

@implementation NSString (FR)

+(NSString *)stringWithInterceptString:(NSString *)string
{
    NSScanner * scanner = [NSScanner scannerWithString:string];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        string = [string stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    
    NSMutableString *MutString = [NSMutableString stringWithString:string];
    NSRange substr = [MutString rangeOfString:@"&nbsp;"];
    while (substr.location != NSNotFound) {
        [MutString replaceCharactersInRange:substr withString:@""];
        substr = [MutString rangeOfString:@"&nbsp;"];
    }
    return MutString;
}


+(NSString *)stringWithInterceptString:(NSString *)string deleteString:(NSString *)deletes
{
    
    NSCharacterSet *characterSet1 = [NSCharacterSet characterSetWithCharactersInString:deletes];

    // 将string1按characterSet1中的元素分割成数组

    NSArray *array = [string componentsSeparatedByCharactersInSet:characterSet1];

    NSMutableString *MutString2 = [[NSMutableString alloc]init];

    for(NSString *string1 in array)
    {
        if ([string1 length]>0) {
            [MutString2 appendString:string1];
      }
    }
    return MutString2;
}


- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


- (CGSize)sizeWithFont:(UIFont *)font labelWidth:(CGFloat)labelWidth
{
    //计算文字的最大尺寸
    CGSize textMaxSize = CGSizeMake(labelWidth, MAXFLOAT);
    //text文字格式
    NSDictionary *attrs = @{NSFontAttributeName : font};
    //label的真实尺寸
    return [self boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
}


/**
 *  时间戳处理
 *
 *  @param needCurrenTime 需要处理的时间戳
 *
 *  @return 返回的时间
 */
+ (NSString *)timeDisposeToTime:(NSString *)needDisposeTime
{
    //** 转换时间戳 */
    NSString *str= [needDisposeTime substringToIndex:10];//时间戳
    
    NSTimeInterval time=[str doubleValue]+28800;   //时间差
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"YYYY年MM月dd日 HH:mm"];
    NSString *currentime = [dateFormatter stringFromDate:detaildate];
    return currentime;
}


@end
