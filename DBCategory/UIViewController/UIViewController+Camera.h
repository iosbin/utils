//
//  UIViewController+Camera.h
//  Efficiency
//
//  Created by 彭伟 on 2017/9/11.
//  Copyright © 2017年 sudiyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Camera)
- (void)judgeIsAvailableForDevice:(void(^)(BOOL isAvailable))completionBlock;
- (void)judgeIsAvailableForDeviceLibrary:(void (^)(BOOL isAvailable))completionBlock;
- (void)checkoutCameraIsAvilable;
- (void)checkoutLibraryIsAvalible;
@end
