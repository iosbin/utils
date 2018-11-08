//
//  UIView+EdgeLine.m
//
//  Created by wangyang on 14-5-16.
//  Copyright (c) 2014年 yinbing. All rights reserved.
//

#import "UIView+EdgeLine.h"
#import <objc/runtime.h>

CGRect getRectLineHeight(CGRect rect, float height)
{
    CGRect lineFrame = rect;
    lineFrame.origin.y -= height;
    lineFrame.size.height = height;
    return lineFrame;
}

@implementation UIView (EdgeLine)

- (void)addEdgeLine
{
    [self addEdgeLineForLineType:EdgeLineTypeAll];
}

- (void)addEdgeLineForLineType:(EdgeLineType)lineType
{
    [self addEdgeLineForHeight:(1.f / [UIScreen mainScreen].scale) lineType:lineType];
}

- (void)addEdgeLineForHeight:(CGFloat)height lineType:(EdgeLineType)lineType
{
    [self addEdgeLineForHeight:height lineType:lineType color:[UIColor lightGrayColor]];
}

- (void)addEdgeLineForHeight:(CGFloat)height lineType:(EdgeLineType)lineType color:(UIColor *)color
{
    if (lineType == EdgeLineTypeAll) {
        lineType = EdgeLineTypeTop | EdgeLineTypeLeft | EdgeLineTypeRight | EdgeLineTypeBottom;
    }
    if ((lineType & EdgeLineTypeTop) == EdgeLineTypeTop) {
        [self.layer addSublayer:[self lineTopLayerForHeight:height color:color]];
    }
    if ((lineType & EdgeLineTypeLeft) == EdgeLineTypeLeft) {
        [self.layer addSublayer:[self lineLeftLayerForHeight:height color:color]];
    }
    if ((lineType & EdgeLineTypeBottom) == EdgeLineTypeBottom) {
        [self.layer addSublayer:[self lineBottomLayerForHeight:height color:color]];
    }
    if ((lineType & EdgeLineTypeRight) == EdgeLineTypeRight) {
        [self.layer addSublayer:[self lineRightLayerForHeight:height color:color]];
    }
    if ((lineType & EdgeLineTypeCenter) == EdgeLineTypeCenter) {
        [self.layer addSublayer:[self lineCenterLayerForHeight:height color:color]];
    }
}

- (CALayer *)lineTopLayerForHeight:(CGFloat)height color:(UIColor *)color
{
    CALayer *lineLayer = [CALayer new];
    lineLayer.frame = CGRectMake(CGRectGetMinX(self.bounds), CGRectGetMinY(self.bounds), CGRectGetWidth(self.bounds), height);
    lineLayer.backgroundColor = color.CGColor;
    return lineLayer;
}

- (CALayer *)lineLeftLayerForHeight:(CGFloat)height color:(UIColor *)color
{
    CALayer *lineLayer = [CALayer new];
    lineLayer.frame = CGRectMake(CGRectGetMinX(self.bounds), CGRectGetMinY(self.bounds), height, CGRectGetHeight(self.bounds));
    lineLayer.backgroundColor = color.CGColor;
    return lineLayer;
}

- (CALayer *)lineBottomLayerForHeight:(CGFloat)height color:(UIColor *)color
{
    CALayer *lineLayer = [CALayer new];
    lineLayer.frame = CGRectMake(CGRectGetMinX(self.bounds), CGRectGetHeight(self.bounds)-height, CGRectGetWidth(self.bounds), height);
    lineLayer.backgroundColor = color.CGColor;
    return lineLayer;
}

- (CALayer *)lineRightLayerForHeight:(CGFloat)height color:(UIColor *)color
{
    CALayer *lineLayer = [CALayer new];
    lineLayer.frame = CGRectMake(CGRectGetWidth(self.bounds)-height, CGRectGetMinY(self.bounds), height, CGRectGetHeight(self.bounds));
    lineLayer.backgroundColor = color.CGColor;
    return lineLayer;
}

- (CALayer *)lineCenterLayerForHeight:(CGFloat)height color:(UIColor *)color
{
    CALayer *lineLayer = [CALayer new];
    lineLayer.frame = CGRectMake(CGRectGetMinX(self.bounds), self.bounds.size.height/2, self.bounds.size.width, height);
    lineLayer.backgroundColor = color.CGColor;
    return lineLayer;
}

- (CALayer *)layerLineForFrame:(CGRect)frame color:(UIColor *)color
{
    CALayer *lineLayer = [CALayer new];
    lineLayer.frame = frame;
    lineLayer.backgroundColor = color.CGColor;
    return lineLayer;
}

@end
