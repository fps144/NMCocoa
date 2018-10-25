//
//  UIColor+NMCocoa.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (NMCocoa)

/**
 * 通过RGB数生成UIColor对象
 *
 * @param rgbValue RGB数
 */
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue;

/**
 * 通过RGBA数生成UIColor对象
 *
 * @param rgbaValue RGB数
 */
+ (UIColor *)colorWithRGBA:(uint32_t)rgbaValue;

/**
 * 通过RGB数和alpha值生成UIColor对象
 *
 * @param rgbValue RGB数
 * @param alpha    透明度
 */
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha;

/**
 * 通过十六进制字符串生成UIColor对象
 *
 * @param hexStr 十六进制字符串
 */
+ (nullable UIColor *)colorWithHexString:(NSString *)hexStr;

/**
 * 通过十六进制字符串和alpha值生成UIColor对象
 *
 * @param hexStr 十六进制字符串
 * @param alpha  透明度
 */
+ (nullable UIColor *)colorWithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
