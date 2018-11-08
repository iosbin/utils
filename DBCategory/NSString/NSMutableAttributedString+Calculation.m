//
//  NSMutableAttributedString+Calculation.m
//  Cbox
//
//  Created by xinchen on 2017/6/15.
//  Copyright © 2017年 yinbing. All rights reserved.
//

#import "NSMutableAttributedString+Calculation.h"

@implementation NSMutableAttributedString (Calculation)
- (CGFloat)heightOfAttributedStringWithFont:(UIFont *)font width:(CGFloat)width
{
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    
    //设定attributedString的字体及大小，一定要设置这个，否则计算出来的height是非常不准确的
    
    [self addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
    
    //计算attributedString的rect
    
    CGRect contentRect = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return contentRect.size.height;
}
@end
