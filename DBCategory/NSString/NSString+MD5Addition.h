//
//  NSString+MD5Addition.h
//  ppxin
//
//  Created by tjianli on 12-9-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(MD5Addition)

- (NSString *) stringFromMD5;

+ (NSString *) jsonStringWithString:(NSString *) string;
+ (NSString *) jsonStringWithArray:(NSArray *)array;
@end

