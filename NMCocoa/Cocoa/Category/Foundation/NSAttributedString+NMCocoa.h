//
//  NSAttributedString+NMCocoa.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (NMCocoa)

+ (NSAttributedString *)attributeStringWithString:(NSString *)string font:(UIFont *)font color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
