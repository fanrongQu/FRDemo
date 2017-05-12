//
//  NSDate+Category.h
//  NetEase News
//
//  Created by 1860 on 16/6/14.
//  Copyright © 2016年 FanrongQu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)


/*
 *  时间戳
 */
@property (nonatomic,copy,readonly) NSString *timestamp;

/*
 *  时间成分
 */
@property (nonatomic,strong,readonly) NSDateComponents *components;

/*
 *  是否是今年
 */
@property (nonatomic,assign,readonly) BOOL isThisYear;

/*
 *  是否是今天
 */
@property (nonatomic,assign,readonly) BOOL isToday;

/*
 *  是否是昨天
 */
@property (nonatomic,assign,readonly) BOOL isYesToday;

/**
 *  判断当前时间是否是晚上
 *
 *  @return YES 晚上   NO 白天
 */
@property (nonatomic,assign,readonly) BOOL isNight;



/**
 *  两个时间比较
 *
 *  @param unit     成分单元
 *  @param fromDate 起点时间
 *  @param toDate   终点时间
 *
 *  @return 时间成分对象
 */
+(NSDateComponents *)dateComponents:(NSCalendarUnit)unit fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

-(NSDate *)offsetMonth:(int)numMonths;
-(NSDate *)offsetDay:(int)numDays;
-(NSDate *)offsetHours:(int)hours;
-(NSInteger)numDaysInMonth;
-(NSInteger)firstWeekDayInMonth;
-(NSInteger)year;
-(NSInteger)month;
-(NSInteger)day;

+(NSDate *)dateStartOfDay:(NSDate *)date;
+(NSDate *)dateStartOfWeek;
+(NSDate *)dateEndOfWeek;

+ (NSString *)dateIntegerForDate:(NSDate *)date;

+ (NSString *)dateWithFormatter:(int)timeValue AndDateFormate:(NSString *)dateFormatter;
+ (NSString *)dateInteger:(NSString *)hour AndMinute:(NSString *)minute Istoday:(BOOL)istoday;

+(NSString*)TimeformatFromSeconds:(NSInteger)seconds;//秒转换成时间格式
+(NSString*)TimeformatFromDateWithDay:(NSInteger)day AndMinutes:(NSInteger)minutes AndSecond:(NSInteger)second;//传入天数 和 时间 转换成时间戳


@end
