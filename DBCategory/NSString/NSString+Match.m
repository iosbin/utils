//
//  NSString+Match.m
//  Tool
//
//  Created by 彭伟 on 16/3/31.
//  Copyright © 2016年 彭伟. All rights reserved.
//

#import "NSString+Match.h"

@implementation NSString (Match)
//手机号
- (BOOL)isMobile {
    //手机号以13，147,176, 15，18开头，八个 \d 数字字符
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:@"^((13[0-9])|(147)|(15[^4,\\D])|(176)|(18[^4,\\D]))\\d{8}$" options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:self options:0 range:NSMakeRange(0, [self length])];
    return numberOfMatches;
}

- (BOOL)isEmail
{
    NSString *		regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *	pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

- (BOOL)isUrl
{
    NSString *		regex = @"http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
    NSPredicate *	pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

- (BOOL)isEmptyOrNull{
    if (!self.length) {
        // null object
        return true;
    } else {
        NSString *trimedString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([trimedString length] == 0) {
            // empty string
            return true;
        } else {
            // is neither empty nor null
            return false;
        }
    }
}

- (BOOL)isContainsString:(NSString *)str
{
    if ([self respondsToSelector:@selector(containsString:)]) {
        return [self containsString:str];
    }else{
        NSRange range = [self rangeOfString:str];
        return range.length != NSNotFound;
    }
}

- (BOOL)isEmptyString
{
    return (self == nil || self.length == 0);
}

- (BOOL)isNumberOnly
{
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}



@end
