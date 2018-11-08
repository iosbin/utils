//
//  NSString+ValiString.m
//  Cbox
//
//  Created by xinchen on 16/7/13.
//  Copyright © 2016年 yinbing. All rights reserved.
//

#import "NSString+ValiString.h"

@implementation NSString (ValiString)

-(BOOL)isValiString
{
    if (![self isKindOfClass:[NSNull class]] && self.length>0)
    {
        return YES;
    }
    return NO;
}


+ (BOOL)stringIsEmpty:(NSString *)str
{
    if ([str isEqual:[NSNull null]]) {
        return YES;
    }
    
    if (str == nil) {
        return YES;
    }
    
    if ([str isKindOfClass:[NSString class]]) {
        NSString *selfstr = (NSString *)str;
        
        if ([selfstr isEqual:nil]) {
            return YES;
        }
        
        if([selfstr isEqualToString:@""]){
            return YES;
        }
        
    }
    
    if ([str isEqualToString:@"(null)"]) {
        return YES;
    }
    
    //  如果字符串里全是空格,  则算空
    NSMutableString *temp = [NSMutableString stringWithString:str];
    [temp replaceOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, str.length)];
    if ([temp isEqualToString:@""]) {
        return YES;
    }
    
    return NO;
    
}


@end
