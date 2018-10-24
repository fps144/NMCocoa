//
//  NSString+NMCocoa.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (NMCocoa)

@property(nonatomic, readonly) BOOL isEmail;

/**
 * 通过UTF8编码生成NSData对象
 */
- (NSData *)UTF8data;

/**
 * 进行md5签名
 */
- (NSString *)md5Encrypt;

/**
 * 进行base64编码
 */
- (NSString *)base64Encode;

/**
 * 进行base64解码
 */
- (NSString *)base64Decode;

/**
 * 转换为拼音
 */
- (NSString *)transformToPinyin;

@end

NS_ASSUME_NONNULL_END
