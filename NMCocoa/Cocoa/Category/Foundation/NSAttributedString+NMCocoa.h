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

/**
 * 返回NSAttributedString对象.
 *
 * @param string 源字符串
 * @param font   源字符串的字体
 * @param color  源字符串的颜色
 */
+ (NSAttributedString *)attributeStringWithString:(NSString *)string
                                             font:(UIFont *)font
                                            color:(UIColor *)color;

/**
 * 返回NSAttributedString对象.
 *
 * @param string          源字符串
 * @param highlightString 源字符串中需要高亮的子串
 * @param stringColor     源字符串的颜色
 * @param highlightColor  子串的颜色
 * @param font            源字符串和子串的字体
 */
+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                   highlightString:(NSString *)highlightString
                                       stringColor:(UIColor *)stringColor
                                    highlightColor:(UIColor *)highlightColor
                                              font:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
