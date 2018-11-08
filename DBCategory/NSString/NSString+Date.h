//
//  NSString+Date.h
//  Tool
//
//  Created by 彭伟 on 16/3/31.
//  Copyright © 2016年 彭伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Date)
/**NSDate转换成NSString*/
+ (nullable NSString *)DateToString:(nullable NSDate *)selectDate mode:(nullable NSString *)modelString;

/**NSString转换成NSDate*/
+ (nullable NSDate*)StringToDate:(nullable NSString*)uiDate Mode:(nullable NSString *)modelString;

/** 返回以1970/01/01 GMT为基准，然后过了secs秒的时间转换成NSString*/
+ (nullable NSString *)since1970ToDate:(NSTimeInterval) secs ;
+ (nullable NSString *)since1970ToDate:(NSTimeInterval) a mode:(nullable NSString *)modelString;
+ (nullable NSString *)getTimeDiffForTimestamp:(nullable NSString *)timestamp mode:(nullable NSString *)modelString;

- (nullable NSString *)messageTimeFormatting;

/**日期转换成 NSTimeInterval */
+ (long)stringToNSTimeIntervalString:(nullable NSString*)uiDate;

/**NSTimeInterval 转换日期*/
+ (nullable NSString *)showLocationTimeInterval:(NSTimeInterval)timeInterval;

@end
