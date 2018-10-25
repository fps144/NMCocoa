//
//  UIButton+NMCocoa.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (NMCocoa)

/**
 * 设置button的背景色
 *
 * @param backgroundColor 背景色
 * @param state           button状态
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

/**
 * 上下居中，图片在上，文字在下
 *
 * @param spacing 图文上下间距
 */
- (void)verticalCenterImageAndTitle:(CGFloat)spacing;

/**
 * 左右居中，文字在左，图片在右
 *
 * @param spacing 图文左右间距
 */
- (void)horizontalCenterTitleAndImage:(CGFloat)spacing;

/**
 * 左右居中，图片在左，文字在右
 *
 * @param spacing 图文左右间距
 */
- (void)horizontalCenterImageAndTitle:(CGFloat)spacing;

/**
 * 文字居中，图片在左
 *
 * @param spacing 图片距文字的距离
 */
- (void)horizontalCenterTitleAndImageLeft:(CGFloat)spacing;

/**
 * 文字居中，图片在右
 *
 * @param spacing 图片距文字的距离
 */
- (void)horizontalCenterTitleAndImageRight:(CGFloat)spacing;

@end

NS_ASSUME_NONNULL_END
