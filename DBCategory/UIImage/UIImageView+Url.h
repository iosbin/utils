//
//  UIImageView+Url.h
//  Cbox
//
//  Created by yinbing on 16/4/8.
//  Copyright © 2016年 yinbing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Url)

- (void)setImageWithURL:(NSString *)url;

- (void)setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder;

@end
