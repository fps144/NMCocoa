//
//  NSDate+NMCocoa.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (NMCocoa)

@property(nonatomic, readonly) NSInteger year;              ///< 年
@property(nonatomic, readonly) NSInteger month;             ///< 月
@property(nonatomic, readonly) NSInteger day;               ///< 日
@property(nonatomic, readonly) NSInteger hour;              ///< 时
@property(nonatomic, readonly) NSInteger minute;            ///< 分
@property(nonatomic, readonly) NSInteger second;            ///< 秒
@property(nonatomic, readonly) NSInteger nanosecond;        ///< 毫秒
@property(nonatomic, readonly) NSInteger weekday;           ///< 周几 (1~7, 第一天是周几基于用户设置)
@property(nonatomic, readonly) NSInteger weekdayOrdinal;    ///< WeekdayOrdinal component
@property(nonatomic, readonly) NSInteger weekOfMonth;       ///< 是当月第几周 (1~5)
@property(nonatomic, readonly) NSInteger weekOfYear;        ///< 是当年第几周 (1~53)
@property(nonatomic, readonly) NSInteger yearForWeekOfYear; ///< YearForWeekOfYear component
@property(nonatomic, readonly) NSInteger quarter;           ///< Quarter component
@property(nonatomic, readonly) BOOL isLeapMonth;            ///< 是否是闰月
@property(nonatomic, readonly) BOOL isLeapYear;             ///< 是否是闰年
@property(nonatomic, readonly) BOOL isToday;                ///< 是否是今天
@property(nonatomic, readonly) BOOL isYesterday;            ///< 是否是昨天
@property(nonatomic, readonly) BOOL isTomorrow;             ///< 是否是明天
@property(nonatomic, readonly) BOOL isThisWeek;             ///< 是否是这周
@property(nonatomic, readonly) BOOL isThisMonth;            ///< 是否是当前月
@property(nonatomic, readonly) BOOL isThisYear;             ///< 是否是今年
@property(nonatomic, readonly) SInt64 timeInterval;         ///< 秒级时间戳
@property(nonatomic, readonly) SInt64 timeIntervalMs;       ///< 毫秒级时间戳

/**
 * 通过给定时间返回NSDate对象
 *
 * @param year  年
 * @param month 月
 # @param day   日
 */
+ (NSDate *)dateWithYear:(NSInteger)year
                   month:(NSInteger)month
                     day:(NSInteger)day;

/**
 * 通过给定时间返回NSDate对象
 *
 * @param year   年
 * @param month  月
 # @param day    日
 * @param hour   时
 * @param minute 分
 # @param second 秒
 */
+ (NSDate *)dateWithYear:(NSInteger)year
                   month:(NSInteger)month
                     day:(NSInteger)day
                    hour:(NSInteger)hour
                  minute:(NSInteger)minute
                  second:(NSInteger)second;

/**
 * 通过毫秒时间戳返回NSDate对象
 *
 * @param nanosecondsTimeInterval 毫秒时间戳
 */
+ (NSDate *)dateWithTimeInterval:(NSTimeInterval)nanosecondsTimeInterval;

/**
 * 判断给定日期与今天是否是同一天
 *
 * @param date 给定日期
 */
- (BOOL)isSameDay:(NSDate *)date;

/**
 * 判断给定的两天是否是同一天
 *
 * @param date        日期
 * @param compareDate 比较的日期
 */
+ (BOOL)isSameDay:(NSDate *)date asDate:(NSDate *)compareDate;

@end

NS_ASSUME_NONNULL_END
