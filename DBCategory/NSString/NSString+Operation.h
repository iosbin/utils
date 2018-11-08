//
//  NSString+Operation.h
//  Tool
//
//  Created by 彭伟 on 16/3/31.
//  Copyright © 2016年 彭伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Operation)
/**
 *  使用正则来替换字符串
 *
 *  @param pattern 正则
 *  @param replace 替换的字符串
 *
 *  @return 替换后的字符串
 */
- (NSString *)stringByPattern:(NSString *)pattern replace:(NSString *)replace;

/**去掉空格*/
- (NSString*)replaceStringWordSpace:(NSString*)changeString;

/**清空字符串中的空白字符*/
- (NSString *)trimString;

/**
 *  写入系统偏好
 *
 *  @param key 写入键值
 */
- (void)saveToNSDefaultsWithKey:(NSString *)key;

@end
