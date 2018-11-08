//
//  UIViewController+Waiting.m
//  UYNTV
//
//  Created by fenggaowei on 16/4/9.
//  Copyright © 2016年 yingbaowang. All rights reserved.
//

#import "UIViewController+Waiting.h"

@implementation UIViewController (Waiting)

- (void)showWaiting
{
//    [HUDManage showLoading];
}

- (void)hiddenWaiting
{
//    [HUDManage hideLoading];
}
- (UIViewController *)currentViewController
    {
        UIWindow *keyWindow  = [UIApplication sharedApplication].keyWindow;
        UIViewController *vc = keyWindow.rootViewController;
        while (vc.presentedViewController)
        {
            vc = vc.presentedViewController;
            
            if ([vc isKindOfClass:[UINavigationController class]])
            {
                vc = [(UINavigationController *)vc visibleViewController];
            }
            else if ([vc isKindOfClass:[UITabBarController class]])
            {
                vc = [(UITabBarController *)vc selectedViewController];
            }
        }
        return vc;
    }
    
- (UINavigationController *)currentNavigationController
{
        return [self currentViewController].navigationController;
}
@end
