//
//  NSArray+Json.h
//  Efficiency
//
//  Created by 彭伟 on 2017/11/28.
//  Copyright © 2017年 sudiyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Json)
/**
 *  转换成JSON串字符串（没有可读性）
 *
 *  @return JSON字符串
 */
- (NSString *)toJSONStrings;

/**
 *  转换成JSON串字符串（有可读性）
 *
 *  @return JSON字符串
 */
- (NSString *)toReadableJSONString;

/**
 *  转换成JSON数据
 *
 *  @return JSON数据
 */
- (NSData *)toJSONData;
@end
