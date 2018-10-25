//
//  UIViewController+NMCocoa.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (NMCocoa)

/**
 *  返回当前的顶层ViewController
 */
+ (nullable UIViewController *)currentVC;

/**
 *  返回当前的导航控制器
 */
+ (nullable UINavigationController *)currentNVC;

/**
 *  返回当前的根导航控制器
 */
+ (nullable UINavigationController *)rootNVC;

/**
 *  返回当前的根导航控制器
 */
+ (void)popToRootVCAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
