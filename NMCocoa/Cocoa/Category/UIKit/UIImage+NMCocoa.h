//
//  UIImage+NMCocoa.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (NMCocoa)

/**
 * 生成一张可定制color和size的图片
 *
 * @param color 自定义颜色
 * @param size  自定义size(非无限大)
 */
+ (nullable UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 * 生成文字水印图片(文本居中)
 *
 * @param image     要生成水印的背景图片
 * @param text   文本内容
 * @param font      字体
 * @param fontColor 字体颜色，默认为白色
 */
+ (UIImage *)waterImageWithBgImage:(UIImage *)image text:(NSString *)text font:(UIFont *)font fontWithColor:(nullable UIColor *)fontColor;

/**
 * 生成水印图片(自定义水印位置)
 *
 * @param bgImage   背景图片
 * @param logoImage 水印图片
 * @param rect      水印图片的rect
 */
+ (UIImage *)waterImageWithBgImage:(UIImage *)bgImage logoImage:(nullable UIImage *)logoImage logoWithRect:(CGRect)rect;

/**
 * 生成一张可定制size的新图(scale与原图相等)
 *
 * @param size 自定义size(非无限大)
 */
- (nullable UIImage *)imageByResizeToSize:(CGSize)size;

/**
 * 生成一张带圆角的新图
 *
 * @param radius 圆角半径
 */
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius;

/**
 * 生成一张带圆角和边框的新图
 *
 * @param radius      圆角半径
 * @param borderWidth 边框宽度
 * @param borderColor 边框颜色
 */
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor;
/**
 * 生成一张带圆角和边框的图
 *
 * @param radius         圆角半径
 * @param corners        圆角类型
 * @param borderWidth    边框宽度
 * @param borderColor    边框颜色
 * @param borderLineJoin 边框线类型
 */
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                                       corners:(UIRectCorner)corners
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor
                                borderLineJoin:(CGLineJoin)borderLineJoin;
@end

NS_ASSUME_NONNULL_END
