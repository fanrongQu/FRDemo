//
//  NSString+FR.h
//  FRDemo
//
//  Created by 1860 on 16/1/5.
//  Copyright © 2016年 QuFanrong. All rights reserved.
//

// 截除字符串中网络请求的无用符号

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (FR)
#pragma mark - 删除字符串中的指定字符
/**
 *  清除网络请求下的字符串中的</> &amp;</title> <p> </p>等网页特殊标示符
 *
 *  @param string 需要处理的字符串
 *
 *  @return 处理后的字符串
 */
+(NSString *)stringWithInterceptString:(NSString *)string;

/**
 *  清除字符串中指定的字符
 *
 *  @param string  需要处理的字符串
 *  @param deletes 需要删除的字符 不需另外加逗号或空格之类的 除非字符串中有你想要去除的空格，此处< p /等都是单独存在，不作为整个字符
 *
 *  @return 处理后的字符串
 */
+(NSString *)stringWithInterceptString:(NSString *)string deleteString:(NSString *)deletes;


#pragma mark - 根据字符串字体大小计算字符串的size
/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  计算label占据位置大小
 *
 *  @param font       label字体大小
 *  @param labelWidth label的宽度
 *
 *  @return label的实际尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font labelWidth:(CGFloat)labelWidth;

#pragma mark - 时间戳转时间
/**
 *  时间戳处理
 *
 *  @param needCurrenTime 需要处理的时间戳
 *
 *  @return 返回的时间
 */
+ (NSString *)timeDisposeToTime:(NSString *)needDisposeTime;

@end
