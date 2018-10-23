//
//  NSFileManager+NMCocoa.m
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import "NSFileManager+NMCocoa.h"

@implementation NSFileManager (NMCocoa)

+ (NSString *)homeDir {
    return NSHomeDirectory();
}

+ (NSString *)docDir {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)libDir {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)cachesDir {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)tmpDir {
    return NSTemporaryDirectory();
}

+ (BOOL)clearCaches {
    NSArray *allSubPaths = [[self defaultManager] contentsOfDirectoryAtPath:[self cachesDir] error:nil];
    NSString *filePath = nil;
    NSError *error = nil;
    for (NSString *subPath in allSubPaths) {
        filePath = [[self cachesDir] stringByAppendingPathComponent:subPath];
        [[self defaultManager] removeItemAtPath:filePath error:&error];
        if (error) {
            return NO;
        }
    }
    return YES;
}

+ (NSInteger)getFileSizeWithPath:(NSString *)filePath {
    BOOL fileExist = [[self defaultManager] fileExistsAtPath:filePath];
    if (!fileExist) {
        return FILE_NOT_EXIST;
    }
    NSDictionary *attributes = [[self defaultManager] attributesOfItemAtPath:filePath error:nil];
    return [attributes[@"NSFileSize"] integerValue];
}

+ (NSInteger)getFileSizeWithURL:(NSURL *)fileURL {
    if ([fileURL isFileURL]) {
        NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:[fileURL path] error:nil];
        return [dict[@"NSFileSize"] integerValue];
    } else {
        NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:[fileURL absoluteString] error:nil];
        return [dict[@"NSFileSize"] integerValue];
    }
}

@end
