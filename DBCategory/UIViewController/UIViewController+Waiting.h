//
//  UIViewController+Waiting.h
//  UYNTV
//
//  Created by fenggaowei on 16/4/9.
//  Copyright © 2016年 yingbaowang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Waiting)

- (void)showWaiting;

- (void)hiddenWaiting;

- (UIViewController *)currentViewController;

- (UINavigationController *)currentNavigationController;

@end
