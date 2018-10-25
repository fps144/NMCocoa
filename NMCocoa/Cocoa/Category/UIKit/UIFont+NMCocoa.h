//
//  UIFont+NMCocoa.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (NMCocoa)

/**
 * 生成UIFont对象(字体: HelveticaNeue-Medium)
 */
+ (nullable UIFont *)mediumFontOfSize:(CGFloat)size NS_AVAILABLE_IOS(8_2);


@end

NS_ASSUME_NONNULL_END
