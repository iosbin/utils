//
//  UIAlertController+Rotating.m
//  Cbox
//
//  Created by yinbing on 16/6/23.
//  Copyright © 2016年 yinbing. All rights reserved.
//

#import "UIAlertController+Rotating.h"

@implementation UIAlertController (Rotating)

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

@end
