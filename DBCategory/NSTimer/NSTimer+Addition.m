//
//  NSTimer+Addition.m
//  Tool
//
//  Created by 彭伟 on 16/3/28.
//  Copyright © 2016年 彭伟. All rights reserved.
//

#import "NSTimer+Addition.h"

@implementation NSTimer (Addition)

- (void)pauseTimer
{
    if (![self isValid]) return;
    [self setFireDate:[NSDate distantFuture]];
}

- (void)resumeTimerWithInterval:(int)interval
{
    if (![self isValid]) return;
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}


@end
