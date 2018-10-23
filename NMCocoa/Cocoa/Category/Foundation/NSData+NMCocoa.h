//
//  NSData+NMCocoa.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (NMCocoa)

/**
 * 通过已经过base64编码的字符串返回NSData对象
 *
 * @param base64EncodedString 已经过base64编码的字符串
 */
+ (NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString;

/**
 * 将NSData对象转为base64编码的字符串
 */
- (NSString *)base64EncodedString;

@end

NS_ASSUME_NONNULL_END
