//
//  NSObject+Conversion.h
//  Car
//
//  Created by yinbing on 14-7-19.
//  Copyright (c) 2014年 yinbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Conversion)

- (NSInteger)asInteger;
- (int)asInt;
- (float)asFloat;
- (BOOL)asBool;
- (BOOL)asDouble;

- (NSNumber *)asNSNumber;
- (NSString *)asNSString;
- (NSDate *)asNSDate;
- (NSData *)asNSData;	// TODO
- (NSArray *)asNSArray;
- (NSArray *)asNSArrayWithClass:(Class)clazz;
- (NSMutableArray *)asNSMutableArray;
- (NSMutableArray *)asNSMutableArrayWithClass:(Class)clazz;
- (NSDictionary *)asNSDictionary;
- (NSMutableDictionary *)asNSMutableDictionary;

@end
