//
//  NSString+Category.h
//  FRCategory
//
//  Created by 1860 on 16/8/12.
//  Copyright © 2016年 FanrongQu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMBase64.h"

@interface NSString (Category)

#pragma mark - 删除字符串中的指定字符
/**
 *  清除网络请求下的字符串中的</> &amp;</title> <p> </p>等网页特殊标示符
 *
 *  @param string 需要处理的字符串
 *
 *  @return 处理后的字符串
 */
+ (NSString *)stringWithInterceptString:(NSString *)string;

/**
 *  清除字符串中指定的字符
 *
 *  @param string  需要处理的字符串
 *  @param deletes 需要删除的字符 不需另外加逗号或空格之类的 除非字符串中有你想要去除的空格，此处< p /等都是单独存在，不作为整个字符
 *
 *  @return 处理后的字符串
 */
+ (NSString *)stringWithInterceptString:(NSString *)string deleteString:(NSString *)deletes;


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



/** 删除所有的空格 */
@property (nonatomic, copy, readonly) NSString* deleteSpace;

/*
 *  时间戳对应的NSDate
 */
@property (nonatomic, strong, readonly) NSDate* date;

+ (NSString*)dictionaryToJsonString:(NSDictionary*)dict;
+ (BOOL)isValide:(NSString*)value;

//UTF-8转码
+ (NSString*)UTF8StringWithString:(NSString*)string;

+ (NSString*)imageWithBase64:(UIImage*)image;

//验证身份证
+ (BOOL)verifyIDCardNumber:(NSString*)value; //验证身份证

//银行卡
+ (BOOL)validateBankCardNumber:(NSString*)bankCardNumber;

//用户名
+ (BOOL)validateUserName:(NSString*)name;

//密码
+ (BOOL)validatePassword:(NSString*)passWord;

//昵称
+ (BOOL)validateNickname:(NSString*)nickname;

+ (NSString*)getCurrentDate;

//获取本机时间
+ (NSString*)stringWithCurrenDate;

//手机号码验证
+ (BOOL)validateMobile:(NSString*)mobile;

//车牌号验证
+ (BOOL)validateCarNo:(NSString*)carNo;

//发动机验证
+ (BOOL)validateEnginno:(NSString*)enginno;

/**
 *  验证中文汉字字母
 */
+ (BOOL)validateString:(NSString*)regStr;
/**
 *  以当前时间为图片名称
 *
 *  @return 图片名称.jpeg
 */
+ (NSString*)imageNameWithCurrentDate;
/**
 *  验证手机号码是否符合规则
 *
 *  @param mobileNum 电话号码
 *
 *  @return YES符合、NO不符合
 */
+ (BOOL)isMobileNumber:(NSString*)mobileNum;
/**
 *  检查密码是否是6-20位 允许特殊字符
 *
 *  @param _text 密码字符串
 *
 *  @return 是否符合符合YES、不符合NO
 */
+ (BOOL)CheckInput:(NSString*)_text;

/**
 *  判断字符串中是否只有中文、英文和数字
 */
+ (BOOL)judgeOnlyIncludeCEN:(NSString*)str;
/**
 *  判断是否只有英文字母和数字
 *
 *  @param str
 *
 *  @return yes or no
 */
+ (BOOL)isEnglishWordOrNumber:(NSString*)str;
/**
 *  只有数字
 *
 *  @param str
 *
 *  @return yes or no
 */
+ (BOOL)isOnlyNumber:(NSString*)str;
/*!
 *  判断输入字符串时候有系统自带表情
 */
+ (BOOL)stringContainsEmoji:(NSString*)string;
/**
 *  时间戳转格式化的时间字符串
 */
- (NSString*)timestampToTimeStringWithFormatString:(NSString*)formatString;



@end
