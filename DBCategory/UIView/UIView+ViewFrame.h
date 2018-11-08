//
//  UIView+ViewFrame.h
//  Tool
//
//  Created by 彭伟 on 16/3/31.
//  Copyright © 2016年 彭伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ViewFrame)
//快速获取一个 view 的 x 坐标
@property (nonatomic, assign) CGFloat mx;
//快速获取一个 view 的 y 坐标
@property (nonatomic, assign) CGFloat my;
//快速获取一个 view 中心点的 x 坐标
@property (nonatomic, assign) CGFloat mcenterX;
//快速获取一个 view 中心点的 y 坐标
@property (nonatomic, assign) CGFloat mcenterY;
//快速获取一个 view 的宽度
@property (nonatomic, assign) CGFloat mwidth;
//快速获取一个 view 的高度
@property (nonatomic, assign) CGFloat mheight;
//快速获取一个 view 的 size
@property (nonatomic, assign) CGSize msize;
//快速获取一个 view 的 origin
@property (nonatomic, assign) CGPoint morigin;

@property (assign, nonatomic) CGFloat mright;
@property (assign, nonatomic) CGFloat mbottom;

- (CGSize)systemLayoutSizeFittingSize;

@end
