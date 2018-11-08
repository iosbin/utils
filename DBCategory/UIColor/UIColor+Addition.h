//
//  UIColor+Addition.h
//  Tool
//
//  Created by 彭伟 on 16/3/28.
//  Copyright © 2016年 彭伟. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HEX2RGB(string) [UIColor colorWithHexString:string]


@interface UIColor (Addition)

//将十六进制数转换成RGB
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)color;


//将十进制数转换成RGB
+(UIColor*)colorWithInt:(unsigned)colorValue;
+(UIColor*)colorWithInt:(unsigned)colorValue alpha:(CGFloat)alpha;


//随机色
+ (UIColor *)RandomColor;

+ (UIColor *)waterBlue;

+ (UIColor *)waterRed;

+ (UIColor *)waterGray;

+ (UIColor *)waterBlack;

@end
