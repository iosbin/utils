//
//  UIView+Corner.m
//  Tool
//
//  Created by 彭伟 on 16/3/31.
//  Copyright © 2016年 彭伟. All rights reserved.
//

#import "UIView+Corner.h"

@implementation UIView (Corner)
-(void)resetView:(UIView *)targetView byRoundingCorners:(UIRectCorner)cornerRect cornerRadii:(CGSize)size{
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:targetView.bounds byRoundingCorners:cornerRect cornerRadii:size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = targetView.bounds;
    maskLayer.path = maskPath.CGPath;
    targetView.layer.mask = maskLayer;
}

#pragma mark - Corner Radius
- (void)setCornerRadius:(float)radius {
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.layer.cornerRadius = radius ? radius : 0.0;
    self.layer.masksToBounds = YES;
}

/**
 *  设置成圆
 */
- (void)setCornerCircle {
    [self setCornerRadius:MIN(CGRectGetHeight(self.bounds), CGRectGetWidth(self.bounds))/2];
}

- (void)addBorderWithWidth:(float)width color:(UIColor *)color {
    self.layer.borderWidth = width ? width : 1.0;
    self.layer.borderColor = color ? color.CGColor : [UIColor blackColor].CGColor;
    self.layer.masksToBounds = YES;
}

- (void)setClipCircleAndColor:(UIColor *)color
{
    [self setCornerCircle];
    [self addBorderWithWidth:1.5 color:color];
}
@end
