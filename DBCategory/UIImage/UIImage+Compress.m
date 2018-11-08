//
//  UIImage+Compress.m
//  Efficiency
//
//  Created by 彭伟 on 2017/8/17.
//  Copyright © 2017年 sudiyi. All rights reserved.
//

#import "UIImage+Compress.h"

@implementation UIImage (Compress)

//max:以KB为单位
- (NSData *)imageDataForMaxSize:(int)max {
    
    CGFloat compression = 1.0f;
    CGFloat minCompression = 0.1f;
    int maxFileSize = max;
    NSData *imageData = UIImageJPEGRepresentation(self, compression);
    
    while ([imageData length]/1000 >= maxFileSize)
    {
        if (compression>minCompression) {
            compression -= 0.1;
            imageData=  UIImageJPEGRepresentation(self, compression);
        }
    }
    return imageData;
}


- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height *scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}



@end
