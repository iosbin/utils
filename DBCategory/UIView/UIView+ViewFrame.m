//
//  UIView+ViewFrame.m
//  Tool
//
//  Created by 彭伟 on 16/3/31.
//  Copyright © 2016年 彭伟. All rights reserved.
//

#import "UIView+ViewFrame.h"

@implementation UIView (ViewFrame)
- (void)setMx:(CGFloat)mx
{
    CGRect frame = self.frame;
    frame.origin.x = mx;
    self.frame = frame;
}

- (void)setMy:(CGFloat)my
{
    CGRect frame = self.frame;
    frame.origin.y = my;
    self.frame = frame;
}

- (CGFloat)mx
{
    return self.frame.origin.x;
}

- (CGFloat)my
{
    return self.frame.origin.y;
}

- (void)setMcenterX:(CGFloat)mcenterX
{
    CGPoint center = self.center;
    center.x = mcenterX;
    self.center = center;
}

- (CGFloat)mcenterX
{
    return self.center.x;
}

- (void)setMcenterY:(CGFloat)mcenterY
{
    CGPoint center = self.center;
    center.y = mcenterY;
    self.center = center;
}

- (CGFloat)mcenterY
{
    return self.center.y;
}

- (void)setMwidth:(CGFloat)mwidth
{
    CGRect frame = self.frame;
    frame.size.width = mwidth;
    self.frame = frame;
}

- (void)setMheight:(CGFloat)mheight
{
    CGRect frame = self.frame;
    frame.size.height = mheight;
    self.frame = frame;
}

- (CGFloat)mheight
{
    return self.frame.size.height;
}

- (CGFloat)mwidth
{
    return self.frame.size.width;
}

- (void)setMsize:(CGSize)msize
{
    CGRect frame = self.frame;
    frame.size = msize;
    self.frame = frame;
}

- (CGSize)msize
{
    return self.frame.size;
}

- (void)setMorigin:(CGPoint)morigin
{
    CGRect frame = self.frame;
    frame.origin = morigin;
    self.frame = frame;
}

- (CGPoint)morigin
{
    return self.frame.origin;
}

- (void)setMright:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right-frame.size.width;
    self.frame = frame;
}

- (CGFloat)mright
{
    return self.frame.size.width + self.frame.origin.x;
}

- (void)setMbottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom-frame.size.height;
    self.frame = frame;
}

- (CGFloat)mbottom
{
    return self.frame.size.height + self.frame.origin.y;
}

- (CGSize)systemLayoutSizeFittingSize
{
    return [self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
}

@end
