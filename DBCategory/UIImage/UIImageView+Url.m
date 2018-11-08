//
//  UIImageView+Url.m
//  Cbox
//
//  Created by yinbing on 16/4/8.
//  Copyright © 2016年 yinbing. All rights reserved.
//

#import "UIImageView+Url.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (Url)

- (void)setImageWithURL:(NSString *)url
{
    [self sd_setImageWithURL:[NSURL URLWithString:url]];
}

- (void)setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder];
}

@end
