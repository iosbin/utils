//
//  UIViewController+BackEvent.h
//  Cbox
//
//  Created by yinbing on 16/6/2.
//  Copyright © 2016年 yinbing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BackEvent)

- (void)backPreviousVC:(NSInteger)index;

- (void)setNaviLeftImageWithName:(NSString *)imageName;
- (void)setLeftItemWithTitle:(NSString *)title;
- (void)setNaviRrightImageWithView:(UIView *)view;
- (void)setNaviRrightImageWithView:(UIView *)view space:(NSInteger)space;

@end
