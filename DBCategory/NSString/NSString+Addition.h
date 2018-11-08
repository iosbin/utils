//
//  NSString+Addition.h
//  04-下载管理类
//
//  Created by vera on 15/9/22.
//  Copyright (c) 2015年 vera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)

/**
 *  返回md5加密的字符串
 *
 *  @return <#return value description#>
 */
- (NSString *)md5;

//chars在content里面的个数
- (NSInteger)specialCharacterCount:(NSString *)chars content:(NSString *)content;

+ (BOOL)stringContrainsEmoji:(NSString *)string;
-(BOOL)isNineKeyBoard;
- (BOOL)hasEmoji;
@end
