//
//  NSString+AttributedString.m
//  Efficiency
//
//  Created by 彭伟 on 2018/3/28.
//  Copyright © 2018年 sudiyi. All rights reserved.
//

#import "NSString+AttributedString.h"

@implementation NSString (AttributedString)

- (NSMutableAttributedString *)attributedStringWithChangeTexts:(NSArray *)changeTexts color:(UIColor *)color
{
    NSMutableAttributedString *textColor = [[NSMutableAttributedString alloc]initWithString:self];
    for (NSString *title in changeTexts) {
        NSRange range = [[textColor string] rangeOfString:title];
        [textColor addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return textColor;
}



@end
