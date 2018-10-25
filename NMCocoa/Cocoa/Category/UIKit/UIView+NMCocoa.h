//
//  UIView+NMCocoa.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (NMCocoa)

@property (nonatomic) CGFloat left;    ///< frame.origin.x.
@property (nonatomic) CGFloat top;     ///< frame.origin.y
@property (nonatomic) CGFloat right;   ///< frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;  ///< frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;   ///< frame.size.width.
@property (nonatomic) CGFloat height;  ///< frame.size.height.
@property (nonatomic) CGFloat centerX; ///< center.x
@property (nonatomic) CGFloat centerY; ///< center.y
@property (nonatomic) CGPoint origin;  ///< frame.origin.
@property (nonatomic) CGSize  size;    ///< frame.size.

@property(nonatomic, strong, readonly) UIViewController *viewController; ///< 当前view的控制器
@property(nonatomic, strong, readonly) UIView *firstResponder; ///< 第一响应者

/**
 * 从当前的视图层级结构中生成一张快照(scale = [UIScreen mainScreen].scale)
 */
- (nullable UIImage *)snapshotImage;

/**
 * 移除当前视图的所有子视图
 */
- (void)removeAllSubviews;

/**
 * 给当前视图添加边框(可用于: 设置当前视图bounds/frame后)
 *
 * @param corner       圆角类型
 * @param cornerRadius 圆角半径
 */
- (void)roundingCorners:(UIRectCorner)corner cornerRadius:(CGFloat)cornerRadius;

/**
 * 给当前视图添加边框(可用于: 设置当前视图bounds/frame后)
 *
 * @param corner       圆角类型
 * @param cornerRadius 圆角半径
 * @param borderWidth  边框宽度
 * @param borderColor  边框颜色
 */
- (void)roundingCorners:(UIRectCorner)corner cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end

NS_ASSUME_NONNULL_END
