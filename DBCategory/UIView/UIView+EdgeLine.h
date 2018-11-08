//
//  UIView+EdgeLine.h
//  Car
//
//  Created by wangyang on 14-5-16.
//  Copyright (c) 2014年 yinbing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, EdgeLineType) {
    EdgeLineTypeTop = 1 << 0,
    EdgeLineTypeLeft = 1 << 1,
    EdgeLineTypeBottom = 1 << 2,
    EdgeLineTypeRight = 1 << 3,
    EdgeLineTypeCenter = 1 << 4,
    EdgeLineTypeAll = 1 << 5
};

#define MinEdgeLine (1.f / [UIScreen mainScreen].scale)

@interface UIView (EdgeLine)

/**
 * 添加边缘线
 */
- (void)addEdgeLine;

- (void)addEdgeLineForLineType:(EdgeLineType)lineType;

- (void)addEdgeLineForHeight:(CGFloat)height lineType:(EdgeLineType)lineType;

- (void)addEdgeLineForHeight:(CGFloat)height lineType:(EdgeLineType)lineType color:(UIColor *)color;

- (CALayer *)layerLineForFrame:(CGRect)frame color:(UIColor *)color;

@end
