//
//  UIImage+Addition.h
//  Tool
//
//  Created by 彭伟 on 16/3/28.
//  Copyright © 2016年 彭伟. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^DoneBlock)(BOOL done);

@interface UIImage (Addition)

- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;

/**
 *  保存图片到相册
 *  @param block 保存成功回调
 */
- (void)saveImageToPhotosBlock:(DoneBlock)block;

/**
 *  改变图片大小
 *  @param targetSize 目标尺寸
 *  @return 修改后的图片
 */
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;

/**创建一张带纯颜色指定大小的图片*/
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

- (UIImage *)fixOrientation;

- (NSData *)scaleImageForMaxSize:(int)max;
- (NSData *)scaleImageFromMinCompressionForMaxSize:(int)max;

- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;

+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
;

@end
