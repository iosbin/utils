//
//  UIView+ViewController.m
//  Cbox
//
//  Created by lgd on 16/4/13.
//  Copyright © 2016年 yinbing. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

- (UIViewController *)viewController
{
    UIResponder *next = self.nextResponder;
    do {
        
        if ([next isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)next;
            break;
        }
        next = next.nextResponder;
    } while (next);
    
    return nil;
}

@end
