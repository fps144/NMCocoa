//
//  NSObject+NMCocoa.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (NMCocoa)

/**
 * hook实例方法
 *
 * @param originalSel 老方法
 * @param hookSel     新方法
 */
+ (BOOL)hookInstanceMethod:(SEL)originalSel with:(SEL)hookSel;

/**
 * hook类方法
 *
 * @param originalSel 老方法
 * @param hookSel     新方法
 */
+ (BOOL)hookClassMethod:(SEL)originalSel with:(SEL)hookSel;

@end

NS_ASSUME_NONNULL_END
