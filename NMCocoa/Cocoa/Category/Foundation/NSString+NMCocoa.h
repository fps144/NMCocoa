//
//  NSString+NMCocoa.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (NMCocoa)

@property(nonatomic, readonly) BOOL isEmail;
@property(nonatomic, readonly) BOOL containsEmoji;
@property(nonatomic, readonly) BOOL containsChinese;

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

/**
 * 返回字符串宽度
 *
 * @param font 字符串字体
 */
- (CGFloat)widthForFont:(UIFont *)font;

/**
 * 返回字符串高度
 *
 * @param font  字符串字体
 * @param width 容器宽度
 */
- (CGFloat)heightForFont:(UIFont *)font containerWidth:(CGFloat)width;

/**
 * 返回字符串size
 *
 * @param font          字符串字体
 * @param size          容器size
 * @param lineBreakMode 断行类型
 */
- (CGSize)sizeForFont:(UIFont *)font containerSize:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

@end

NS_ASSUME_NONNULL_END
