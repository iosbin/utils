//
//  NSString+AttributedString.h
//  Efficiency
//
//  Created by 彭伟 on 2018/3/28.
//  Copyright © 2018年 sudiyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AttributedString)

- (NSMutableAttributedString *)attributedStringWithChangeTexts:(NSArray *)changeTexts color:(UIColor *)color;
@end
