//
//  NSString+MD5Addition.m
//  ppxin
//
//  Created by tjianli on 12-9-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSString+MD5Addition.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString(MD5Addition)

- (NSString *) stringFromMD5{
    
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (unsigned int)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
#if !__has_feature(objc_arc)
    return [outputString autorelease];
#endif
#if __has_feature(objc_arc)
    return outputString;
#endif
    
}

+(NSString *) jsonStringWithString:(NSString *) string{
    
    return [NSString stringWithFormat:@"\"%@\"",
            
            [[string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""]
            
            ];
    
}

+(NSString *) jsonStringWithArray:(NSArray *)array{
    
    NSMutableString *reString = [NSMutableString string];
    
    [reString appendString:@"["];
    
    NSMutableArray *values = [NSMutableArray array];
    
    for (id valueObj in array) {
        
        NSString *value = [NSString jsonStringWithObject:valueObj];
        
        if (value) {
            
            [values addObject:[NSString stringWithFormat:@"%@",value]];
            
        }
        
    }
    
    [reString appendFormat:@"%@",[values componentsJoinedByString:@","]];
    
    [reString appendString:@"]"];
    
    return reString;
    
}

+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary{
    
    NSArray *keys = [dictionary allKeys];
    
    NSMutableString *reString = [NSMutableString string];
    
    [reString appendString:@"{"];
    
    NSMutableArray *keyValues = [NSMutableArray array];
    
    for (int i=0; i<[keys count]; i++) {
        
        NSString *name = [keys objectAtIndex:i];
        
        id valueObj = [dictionary objectForKey:name];
        
        NSString *value = [NSString jsonStringWithObject:valueObj];
        
        if (value) {
            
            [keyValues addObject:[NSString stringWithFormat:@"\"%@\":%@",name,value]];
            
        }
        
    }
    
    [reString appendFormat:@"%@",[keyValues componentsJoinedByString:@","]];
    
    [reString appendString:@"}"];
    
    return reString;
    
}

+(NSString *) jsonStringWithObject:(id) object{
    
    NSString *value = nil;
    
    if (!object) {
        
        return value;
        
    }
    
    if ([object isKindOfClass:[NSString class]]) {
        
        value = [NSString jsonStringWithString:object];
        
    }else if([object isKindOfClass:[NSDictionary class]]){
        
        value = [NSString jsonStringWithDictionary:object];
        
    }else if([object isKindOfClass:[NSArray class]]){
        
        value = [NSString jsonStringWithArray:object];
        
    }else if([object isKindOfClass:[NSNumber class]]){
        
        value = [object stringValue];
    }
    
    return value;
    
}
@end

