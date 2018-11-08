//
//  NSFileManager+Path.m
//  MFGPK
//
//  Created by yinbing on 15/10/18.
//  Copyright © 2015年 com.mofangge.www. All rights reserved.
//

#import "NSFileManager+Path.h"

@implementation NSFileManager (Path)

/** 获得document */
+(NSString *)documentsPath {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [paths objectAtIndex:0];
}

/** 读取工程文件 */
+(NSString *)productPath:(NSString*)filename{

    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@""];
    return  path;
}

/** 获得document文件路径  */
+(NSString *)fullpathOfFilename:(NSString *)filename {
    
    NSString *documentsPath = [self documentsPath];
    
    // NSLog(@"documentsPath=%@",documentsPath);
    
    return [documentsPath stringByAppendingPathComponent:filename];
}

/** 写入文件沙盒位置NSDictionary  */
+(void)saveNSDictionaryForDocument:(NSDictionary *)list  fileUrl:(NSString*)fileUrl  {

    NSString *f = [self fullpathOfFilename:fileUrl];
    if (![NSFileManager FileIsExists:f]) {
        [NSFileManager createFile:f];
    }
    if([list writeToFile:f atomically:YES]){
        NSLog(@"字典写入成功-》%@",list);
    }
    
}

/** 写入文件存放到工程位置NSDictionary   */
+(void)saveNSDictionaryForProduct:(NSDictionary *)list  fileUrl:(NSString*)fileUrl  {

    NSString *ProductPath =[[NSBundle mainBundle]  resourcePath];
    
    NSString *f=[ProductPath stringByAppendingPathComponent:fileUrl];

    [list writeToFile:f atomically:YES];
}

/** 写入文件 Array 工程  */
+(void)saveOrderArrayListProduct:(NSMutableArray *)list  fileUrl:(NSString*)fileUrl {
    
    NSString *ProductPath =[[NSBundle mainBundle]  resourcePath];
    
    NSString *f=[ProductPath stringByAppendingPathComponent:fileUrl];
    [list writeToFile:f atomically:YES];
}

/** 写入文件 Array 沙盒  */
+(void)saveOrderArrayList:(NSMutableArray *)list  fileUrl:(NSString*)fileUrl {
    
    NSString *f = [self fullpathOfFilename:fileUrl];
    [list writeToFile:f atomically:YES];
    
}

/** 加载文件沙盒NSDictionary  */
+(NSDictionary *)loadNSDictionaryForDocument:(NSString*)fileUrl {
    
    NSString *f = [self fullpathOfFilename:fileUrl];
    
    NSDictionary *list = [[NSDictionary alloc] initWithContentsOfFile:f];
    return list;
}

/** 加载文件工程位置NSDictionary */
+(NSDictionary *)loadNSDictionaryForProduct:(NSString*)fileUrl {
    
    NSString *f = [self productPath:fileUrl];
    
    NSDictionary *list =[NSDictionary dictionaryWithContentsOfFile:f];
    return list;  
}

/** 加载文件沙盒NSArray */
+(NSArray *)loadArrayList:(NSString*)fileUrl {
    
    NSString *f = [self fullpathOfFilename:fileUrl];

    NSArray *list = [NSArray  arrayWithContentsOfFile:f];
    return list;
}

/** 加载文件工程位置NSArray */
+(NSArray *)loadArrayListProduct:(NSString*)fileUrl {
    NSString *f = [self productPath:fileUrl];
    NSArray *list = [NSArray  arrayWithContentsOfFile:f];
    return list;
    
}

/** 拷贝文件到沙盒 */
+(int)CopyFileToDocument:(NSString*)fileName{
    
    NSString *appFileName =[self fullpathOfFilename:fileName];
    NSFileManager *fm = [NSFileManager defaultManager];
    //判断沙盒下是否存在
    BOOL isExist = [fm fileExistsAtPath:appFileName];
    
    if (!isExist)   //不存在，把工程的文件复制document目录下
    {
        //获取工程中文件
        
        NSString *backupDbPath = [[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:fileName];

        //这一步实现数据库的添加，  
        
        // 通过NSFileManager 对象的复制属性，把工程中数据库的路径复制到应用程序的路径上  
        NSError * error = nil;
        BOOL cp = [fm copyItemAtPath:backupDbPath toPath:appFileName error:&error];
        return cp;
    } else {
        return  -1; //已经存在
    } 
   
}

//判断文件是否存在

+(BOOL)FileIsExists:(NSString*)checkFile{
    
    if([[NSFileManager defaultManager] fileExistsAtPath:checkFile])
    {
        return true;
    }
    return  false;
}

+ (void)createFile:(NSString *)file
{
    [[NSFileManager defaultManager] createFileAtPath:file contents:nil attributes:nil];
}

@end
