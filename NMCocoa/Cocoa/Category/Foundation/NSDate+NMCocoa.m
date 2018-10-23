//
//  NSDate+NMCocoa.m
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import "NSDate+NMCocoa.h"

@implementation NSDate (NMCocoa)

#pragma mark - Public
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    return [self dateWithYear:year month:month day:day hour:0 minute:0 second:0];
}

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = year;
    components.month = month;
    components.day = day;
    components.hour = hour;
    components.minute = minute;
    components.second = second;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

+ (NSDate *)dateWithTimeInterval:(NSTimeInterval)nanosecondsTimeInterval {
    return [[NSDate alloc] initWithTimeIntervalSince1970:nanosecondsTimeInterval / 1000];
}

- (BOOL)isSameDay:(NSDate *)date {
    return [NSDate isSameDay:self asDate:date];
}

+ (BOOL)isSameDay:(NSDate *)date asDate:(NSDate *)compareDate {
    return date.year == compareDate.year && date.day == compareDate.day;
}

#pragma mark - Getter
- (NSInteger)year {
    return [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:self];
}

- (NSInteger)month {
    return [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:self];
}

- (NSInteger)day {
    return [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:self];
}

- (NSInteger)hour {
    return [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:self];
}

- (NSInteger)minute {
    return [[NSCalendar currentCalendar] component:NSCalendarUnitMinute fromDate:self];
}

- (NSInteger)second {
    return [[NSCalendar currentCalendar] component:NSCalendarUnitSecond fromDate:self];
}

- (NSInteger)nanosecond {
    return [[NSCalendar currentCalendar] component:NSCalendarUnitNanosecond fromDate:self];
}

- (NSInteger)weekday {
    return [[NSCalendar currentCalendar] component:NSCalendarUnitWeekday fromDate:self];
}

- (NSInteger)weekdayOrdinal {
    return [[NSCalendar currentCalendar] component:NSCalendarUnitWeekdayOrdinal fromDate:self];
}

- (NSInteger)weekOfMonth {
    return [[NSCalendar currentCalendar] component:NSCalendarUnitWeekOfMonth fromDate:self];
}

- (NSInteger)weekOfYear {
    return [[NSCalendar currentCalendar] component:NSCalendarUnitWeekOfYear fromDate:self];
}

- (NSInteger)yearForWeekOfYear {
    return [[NSCalendar currentCalendar] component:NSCalendarUnitYearForWeekOfYear fromDate:self];
}

- (NSInteger)quarter {
    return [[NSCalendar currentCalendar] component:NSCalendarUnitQuarter fromDate:self];
}

- (BOOL)isLeapMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] isLeapMonth];
}

- (BOOL)isLeapYear {
    NSUInteger year = self.year;
    return (year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0));
}

- (BOOL)isToday {
//    return (fabs(self.timeIntervalSinceNow) < 60 * 60 * 24) && ([NSDate date].day == self.day);
    return [[NSCalendar currentCalendar] isDateInToday:self];
}

- (BOOL)isYesterday {
    return [[NSCalendar currentCalendar] isDateInYesterday:self];
}

- (BOOL)isTomorrow {
    return [[NSCalendar currentCalendar] isDateInTomorrow:self];
}

- (BOOL)isThisWeek {
    NSDate *now = [NSDate date];
    return self.year == now.year && self.weekOfYear == now.weekOfYear;
}

- (BOOL)isThisMonth {
    return [[NSCalendar currentCalendar] isDate:self equalToDate:[NSDate date] toUnitGranularity:NSCalendarUnitMonth];
}

- (BOOL)isThisYear {
    return [[NSCalendar currentCalendar] isDate:self equalToDate:[NSDate date] toUnitGranularity:NSCalendarUnitYear];
}

- (SInt64)timeInterval {
    return (SInt64)self.timeIntervalSince1970;
}

- (SInt64)timeIntervalMs {
    return (SInt64)(self.timeIntervalSince1970 * 1000);
}

@end
