//
//  NSFileManager+Path.h
//  MFGPK
//
//  Created by yinbing on 15/10/18.
//  Copyright © 2015年 com.mofangge.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Path)

/** 获得document */
+(NSString *)documentsPath;

/** 读取工程文件 */
+(NSString *)productPath:(NSString*)filename;

/** 获得document文件路径  */
+(NSString *)fullpathOfFilename:(NSString *)filename;

/** 写入文件沙盒位置NSDictionary  */
+(void)saveNSDictionaryForDocument:(NSDictionary *)list  fileUrl:(NSString*)fileUrl;

/** 写入文件存放到工程位置NSDictionary   */
+(void)saveNSDictionaryForProduct:(NSDictionary *)list  fileUrl:(NSString*)fileUrl;

/** 写入文件 Array 工程  */
+(void)saveOrderArrayListProduct:(NSMutableArray *)list  fileUrl:(NSString*)fileUrl;

/** 写入文件 Array 沙盒  */
+(void)saveOrderArrayList:(NSMutableArray *)list  fileUrl:(NSString*)fileUrl;

/** 加载文件沙盒NSDictionary  */
+(NSDictionary *)loadNSDictionaryForDocument:(NSString*)fileUrl;

/** 加载文件工程位置NSDictionary */
+(NSDictionary *)loadNSDictionaryForProduct:(NSString*) fileUrl;

/** 加载文件沙盒NSArray */
+(NSArray *)loadArrayList:(NSString*) fileUrl;

/** 加载文件工程位置NSArray */
+(NSArray *)loadArrayListProduct:(NSString*) fileUrl;

/** 拷贝文件到沙盒 */
+(int)CopyFileToDocument:(NSString*)fileName;

//判断文件是否存在

+(BOOL)FileIsExists:(NSString*)checkFile;

+ (void)createFile:(NSString *)file;

@end
