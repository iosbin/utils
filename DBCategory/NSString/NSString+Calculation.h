//
//  NSString+Calculation.h
//  Tool
//
//  Created by 彭伟 on 16/3/31.
//  Copyright © 2016年 彭伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/** 是否为iOS7 */
#define iOS7 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? YES : NO)

@interface NSString (Calculation)
/**计算字符串的尺寸*/
- (CGSize)sizeOfStringWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**计算字符串的高度 */
- (CGFloat)heightOfStringWithFont:(UIFont *)font width:(CGFloat)width;
- (CGFloat)widthOfStringWithFont:(UIFont *)font height:(CGFloat)height;

- (CGFloat)heightOfStringWithWidth:(CGFloat)width;

/**计算带有行距和字间距的字符串占用空间大小*/
- (CGSize)maxSize:(CGSize)maxSize font:(UIFont*)font lineSpace:(CGFloat)lineSpace wordSpace:(CGFloat)wordSpace color:(UIColor*)color;

/**返回富文本*/
- (NSMutableAttributedString*)font:(UIFont*)font lineSpace:(CGFloat)lineSpace wordSpace:(CGFloat)worldSpace color:(UIColor*)color textAligment:(NSTextAlignment)textAligament;

/**计算文件夹大小*/
- (long long)fileSize;

- (NSMutableAttributedString *)textAligment:(NSTextAlignment)textAligament font:(UIFont *)font;

@end
