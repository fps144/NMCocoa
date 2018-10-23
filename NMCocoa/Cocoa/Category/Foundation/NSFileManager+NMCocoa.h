//
//  NSFileManager+NMCocoa.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define FILE_NOT_EXIST -1

@interface NSFileManager (NMCocoa)

/**
 * 返回沙盒主目录路径
 */
+ (NSString *)homeDir;

/**
 * 返回Documents目录路径
 */
+ (NSString *)docDir;

/**
 * 返回Library目录路径
 */
+ (NSString *)libDir;

/**
 * 返回Temporary目录路径
 */
+ (NSString *)tmpDir;

/**
 * 返回Caches目录路径
 */
+ (NSString *)cachesDir;

/**
 * 清空Caches目录
 */
+ (BOOL)clearCaches;

/**
 * 返回给定路径的文件大小(文件不存在则返回-1)
 *
 * @param filePath 文件路径
 */
+ (NSInteger)getFileSizeWithPath:(NSString *)filePath;

/**
 * 返回给定URL的文件大小(文件不存在则返回-1)
 *
 * @param fileURL 文件URL
 */
+ (NSInteger)getFileSizeWithURL:(NSURL *)fileURL;

@end

NS_ASSUME_NONNULL_END
