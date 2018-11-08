//
//  NSString+Date.m
//  Tool
//
//  Created by 彭伟 on 16/3/31.
//  Copyright © 2016年 彭伟. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)
+ (nullable NSDate*)StringToDate:(NSString*)uiDate Mode:(NSString *)modelString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:modelString];
    NSDate *date=[formatter dateFromString:uiDate];
    return date;
}

+ (nullable NSString *)DateToString:(NSDate *)selectDate mode:(NSString *)modelString
{
    NSDateFormatter *selectDateFormater = [[NSDateFormatter alloc] init];
    [selectDateFormater setDateFormat:modelString];
    NSString *selectDataString = [selectDateFormater stringFromDate:selectDate];
    return selectDataString;
}

+ (nullable NSString *)since1970ToDate:(NSTimeInterval) a
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:a ];
    NSString *string = [NSString DateToString:date mode:@"yyyy-MM-dd HH:mm"];
    return string;
}

+ (nullable NSString *)since1970ToDate:(NSTimeInterval) a mode:(NSString *)modelString
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:a ];
    NSString *string = [NSString DateToString:date mode:modelString];
    return string;
}


+ (nullable NSString *)getTimeDiffForTimestamp:(NSString *)timestamp mode:(NSString *)modelString
{
    double sendTime = [timestamp doubleValue];
    NSDate *localDate = [NSDate date];
    NSTimeInterval nowTime = [localDate timeIntervalSince1970];
    
    double timeDiff = nowTime - sendTime;
    if (timeDiff < 0) {
        return @"";
    } else if (timeDiff < 60) {
        return [NSString stringWithFormat:@"%d秒前",(int)timeDiff];
    } else if (timeDiff < 60*60) {
        return [NSString stringWithFormat:@"%d分钟前",(int)(timeDiff/60)];
    } else if (timeDiff < 24 * 60* 60) {
        return [NSString stringWithFormat:@"%d小时前",(int)(timeDiff/(60*60))];
    } else {
        return [NSString since1970ToDate:sendTime mode:modelString];
    }
}

#pragma mark 获取短视频发送时间
-(nullable NSString *)messageTimeFormatting{
    
    /*
     视频发布时间15分钟内，显示 刚刚
     超过15分钟，显示几点几分
     昨天发布的，显示昨天+几点几分，例如：昨天12:00
     超过昨天的，显示日期+时间
     */
    
    //将目标13位时间戳转成10位时间戳的NSDate,方便后续调用
    NSDate *messageDate = [NSDate dateWithTimeIntervalSince1970:(int)([self doubleValue]/1000)];
    //实例化一个NSDateFormatter对象
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    
    //获取当前时间戳
    //测试数据 测试时间 2017年5月24日 17:48:23 时间戳为1495619303000
    //    int nowTimeInt = 1495619303;
    //正式数据需去掉下面一行的注释,并注释上面一行的代码
    int nowTimeInt = [[NSDate  date] timeIntervalSince1970];
    
    NSLog(@"nowTimeInt:%d",nowTimeInt);
    //目标时间跟当前时间做时间差
    int timeDifferenceInt = nowTimeInt-(int)([self doubleValue]/1000);
    
    if  (timeDifferenceInt <= 15*60) {
        //视频发布时间15分钟内，显示 刚刚
        return @"刚刚";
    }
    else if ([[self getZeroOfDateCompareToday:0] compare:messageDate] == NSOrderedAscending){
        //超过15分钟，显示几点几分
        [dateFormat setDateFormat:@"HH:mm"];
        NSString *messageDateStr = [dateFormat stringFromDate:messageDate];
        return messageDateStr;
    }else if ([[self getZeroOfDateCompareToday:-1] compare:messageDate] == NSOrderedAscending){
        //昨天发布的，显示昨天+几点几分，例如：昨天12:00
        [dateFormat setDateFormat:@"HH:mm"];
        NSString *messageDateStr = [dateFormat stringFromDate:messageDate];
        return [NSString stringWithFormat:@"昨天%@",messageDateStr];
    }
    else
    {
        //超过昨天的，显示日期+时间
        [dateFormat setDateFormat:@"MM-dd HH:mm"];
        NSString *messageDateStr = [dateFormat stringFromDate:messageDate];
        return messageDateStr;
    }
}

- (NSDate *)getZeroOfDateCompareToday:(int)date {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    [components setDay:([components day]+date)];
    
    NSDate *zoreDate = [gregorian dateFromComponents:components];
    return zoreDate;
}
+ (long)stringToNSTimeIntervalString:(nullable NSString*)uiDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:uiDate];
    return (long)[date timeIntervalSince1970];
}

+ (nullable NSString *)showLocationTimeInterval:(NSTimeInterval)timeInterval
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSString *string = [NSString DateToString:date mode:@"yyyy.MM.dd HH:mm"];
    return string;
}
@end
