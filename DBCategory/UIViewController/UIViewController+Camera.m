//
//  UIViewController+Camera.m
//  Efficiency
//
//  Created by 彭伟 on 2017/9/11.
//  Copyright © 2017年 sudiyi. All rights reserved.
//

#import "UIViewController+Camera.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <Photos/Photos.h>
@implementation UIViewController (Camera)

- (void)judgeIsAvailableForDevice:(void (^)(BOOL))completionBlock
{
    
    if ([self judgeIsHaveCamera]) {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)
        {
            [self alertCameraAuthorityTips];
            if (completionBlock) {
                completionBlock(NO);
            }
        }else{
            if (completionBlock) {
                completionBlock(YES);
            }
        }
        
    }
}

- (BOOL)judgeIsHaveCamera
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        return YES;
    }else{
        [self alertCameraAuthorityTips];
    }
    return NO;
}

- (void)alertCameraAuthorityTips
{
    TCAlertAction *confirmAction = [TCAlertAction actionWithTitle:@"好的" style:kTCAlertActionStyleDefault handler:^(TCAlertAction *action) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    }];
    TCAlertController *alertController = [[TCAlertController alloc] initAlertViewWithTitle:@"提醒" message:[NSString stringWithFormat:@"请在手机【设置】-【隐私】-【相机】选项中，允许【%@】访问您的相机",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]] presentCtrler:self cancelAction:nil otherAction:confirmAction,nil ];
    [alertController show];
}


- (void)judgeIsAvailableForDeviceLibrary:(void (^)(BOOL))completionBlock
{
    if ([self judgeIsCanVisitLibrary]) {
        PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
        
        if (authStatus == PHAuthorizationStatusRestricted || authStatus ==PHAuthorizationStatusDenied)
        {
            [self alertLabraryAuthorityTips];
            if (completionBlock) {
                completionBlock(NO);
            }
        }else{
            if (completionBlock) {
                completionBlock(YES);
            }
        }
    }
}

- (BOOL)judgeIsCanVisitLibrary
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        return YES;
    }else{
        [self alertLabraryAuthorityTips];
    }
    return NO;
}

- (void)alertLabraryAuthorityTips
{
    TCAlertAction *confirmAction = [TCAlertAction actionWithTitle:@"好的" style:kTCAlertActionStyleDefault handler:^(TCAlertAction *action) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    }];
    TCAlertController *alertController = [[TCAlertController alloc] initAlertViewWithTitle:@"提醒" message:[NSString stringWithFormat:@"请在手机【设置】-【隐私】-【照片】选项中，允许【%@】访问您的照片",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]] presentCtrler:self cancelAction:nil otherAction:confirmAction,nil ];
    [alertController show];
}

- (void)checkoutCameraIsAvilable
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (granted) {
                    
                }
            });
        }];
    }
}

- (void)checkoutLibraryIsAvalible
{
    PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
    if (authStatus == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            
        }];
    }
}




@end
