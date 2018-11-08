//
//  NSString+Match.h
//  Tool
//
//  Created by 彭伟 on 16/3/31.
//  Copyright © 2016年 彭伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Match)
/**验证手机号码*/
- (BOOL)isMobile;

/**验证邮箱*/
- (BOOL)isEmail;

/**验证url*/
- (BOOL)isUrl;

/**验证字符串是否为空或NULL*/
- (BOOL)isEmptyOrNull;

/**
 *  是否包含字符串
 *
 *  @param str 字符串
 *
 *  @return 是否包含
 */
- (BOOL)isContainsString:(NSString *)str;

/**是否为空字符串*/
- (BOOL)isEmptyString;

/**是否为数字字符串*/
- (BOOL)isNumberOnly;


@end
