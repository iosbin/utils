//
//  NSDictionary+Key.h
//  BaiGao
//
//  Created by yinbing on 14-3-20.
//  Copyright (c) 2014年 yinbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Key)

/**
 *  取得的值转换string
 */
- (NSString *)stringForKey:(id)key;
/**
 *  取得的值转换float
 */
- (CGFloat)floatForKey:(id)key;
/**
 *  取得的值转换integer
 */
- (NSInteger)integerForKey:(id)key;
/**
 *  取得的值转换int
 */
- (int)intForKey:(id)key;
/**
 *  取得的值转换BOOL
 */
- (BOOL)boolForKey:(id)key;
/**
 *  取得的值转换double
 */
- (double)doubleForKey:(id)key;
/**
 *  取得的值转换array
 */
- (NSArray *)arrayForKey:(id)key;

/**
 *  取得的值转换NSDictionary
 */
- (NSDictionary *)dicForKey:(id)key;
/**
 *  取得的值转换NSNumber
 */
- (NSNumber *)numberForKey:(id)key;
@end

@interface NSMutableDictionary (SetKey)

@end

@interface NSNull (Safe)

- (NSInteger)length;

@end
