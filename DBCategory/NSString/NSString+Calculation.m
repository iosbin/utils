//
//  NSString+Calculation.m
//  Tool
//
//  Created by 彭伟 on 16/3/31.
//  Copyright © 2016年 彭伟. All rights reserved.
//

#import "NSString+Calculation.h"
#import <CoreText/CoreText.h>

@implementation NSString (Calculation)

- (long long)fileSize
{
    NSFileManager *mgr = [NSFileManager defaultManager];
    BOOL isDirectory = NO;
    BOOL fileExists = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    
    if (fileExists == NO) return 0;
    
    if (isDirectory) {
        NSArray *subpaths = [mgr contentsOfDirectoryAtPath:self error:nil];
        long long totalSize = 0;
        for (NSString *subpath in subpaths) {
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            totalSize += [fullSubpath fileSize];
        }
        return totalSize;
    } else {
        NSDictionary *attr = [mgr attributesOfItemAtPath:self error:nil];
        return [attr[NSFileSize] longLongValue];
    }
}

- (CGSize)sizeOfStringWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *fontDict = @{NSFontAttributeName : font};
    
    CGRect rect = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:fontDict context:nil];
    return rect.size;
}

- (CGFloat)heightOfStringWithFont:(UIFont *)font width:(CGFloat)width
{
    NSDictionary *fontDict = @{NSFontAttributeName : font};
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    
    CGRect rect = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDict context:nil];
    return rect.size.height;
}

- (CGFloat)widthOfStringWithFont:(UIFont *)font height:(CGFloat)height
{
    NSDictionary *fontDict = @{NSFontAttributeName : font};
    CGSize maxSize = CGSizeMake(MAXFLOAT, height);
    
    CGRect rect = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDict context:nil];
    return rect.size.width;
}

- (CGFloat)heightOfStringWithWidth:(CGFloat)width
{
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:self];
    NSRange range = NSMakeRange(0, attrStr.length);
    NSDictionary *dic = [attrStr attributesAtIndex:0 effectiveRange:&range];
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    
    CGRect rect = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return rect.size.height;
}



- (CGSize)maxSize:(CGSize)maxSize font:(UIFont*)font lineSpace:(CGFloat)lineSpace wordSpace:(CGFloat)wordSpace color:(UIColor*)color
{
    if (self==nil) {
        return CGSizeZero;
    }
    
    NSMutableParagraphStyle *paraStyle=[NSMutableParagraphStyle new];
    paraStyle.lineSpacing=lineSpace;
    paraStyle.lineBreakMode=NSLineBreakByWordWrapping;
    
    
    long number = wordSpace;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    
    NSDictionary *dict=@{ NSFontAttributeName:font,NSParagraphStyleAttributeName: paraStyle ,NSForegroundColorAttributeName : color ,(id)kCTKernAttributeName : (__bridge id)num};
    CGSize titleSize= [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return titleSize;
    
}


- (NSMutableAttributedString*)font:(UIFont*)font lineSpace:(CGFloat)lineSpace wordSpace:(CGFloat)worldSpace color:(UIColor*)color textAligment:(NSTextAlignment)textAligament
{
    if (self==nil) {
        return nil;
    }
    
    NSRange range=NSMakeRange(0, self.length);
    
    NSMutableAttributedString *attributedString=[[NSMutableAttributedString alloc]initWithString:self];
    
    NSMutableParagraphStyle *paraStyle=[NSMutableParagraphStyle new];
    paraStyle.lineSpacing=lineSpace;
    paraStyle.lineBreakMode=NSLineBreakByCharWrapping;
    paraStyle.alignment=textAligament;
    
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paraStyle range:range];
    [attributedString addAttribute:NSFontAttributeName value:font range:range];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    long number = worldSpace;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0,[attributedString length])];
    CFRelease(num);
    
    return attributedString;
}

- (NSMutableAttributedString *)textAligment:(NSTextAlignment)textAligament font:(UIFont *)font{
    if (self==nil) {
        return nil;
    }
    
    NSRange range=NSMakeRange(0, self.length);

    NSMutableAttributedString *attributedString=[[NSMutableAttributedString alloc]initWithString:self];
    NSMutableParagraphStyle *paraStyle=[NSMutableParagraphStyle new];
    paraStyle.alignment=textAligament;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paraStyle range:range];
    [attributedString addAttribute:NSFontAttributeName value:font range:range];

    
    return attributedString;
}


@end
