//
//  NSTimer+Addition.h
//  Tool
//
//  Created by 彭伟 on 16/3/28.
//  Copyright © 2016年 彭伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Addition)

//  暂停timer
-(void)pauseTimer;

//  继续执行timer
- (void)resumeTimerWithInterval:(int)interval;


@end
