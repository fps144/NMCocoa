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

@property(nonatomic, strong) UIViewController *vc; ///< 当前view的控制器

/**
 * 从当前的视图层级结构中生成一张快照
 */
- (nullable UIImage *)snapshotImage;

/**
 * 从当前的视图层级结构中生成一张快照的PDF
 */
- (nullable NSData *)snapshotPDF;

@end

NS_ASSUME_NONNULL_END
