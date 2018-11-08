//
//  NSString+Operation.m
//  Tool
//
//  Created by 彭伟 on 16/3/31.
//  Copyright © 2016年 彭伟. All rights reserved.
//

#import "NSString+Operation.h"

@implementation NSString (Operation)
- (NSString*)replaceStringWordSpace:(NSString *)changeString
{
    NSArray *array=[changeString componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    return [array componentsJoinedByString:@""];
}

- (NSString *)stringByPattern:(NSString *)pattern replace:(NSString *)replace
{
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    return [regex stringByReplacingMatchesInString:self
                                           options:0
                                             range:NSMakeRange(0, self.length)
                                      withTemplate:replace];
}

- (void)saveToNSDefaultsWithKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:self forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)trimString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
