//
//  NSArray+Safe.m
//  Cbox
//
//  Created by yinbing on 16/4/21.
//  Copyright © 2016年 yinbing. All rights reserved.
//

#import "NSArray+Safe.h"

@implementation NSArray (Safe)

- (id)safeObjectIndex:(NSUInteger)index
{
    if (self.count <= index) {
        return nil;
    }
    return [self objectAtIndex:index];
}

@end
