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
 * Returns an NSAttributedString object.
 *
 * @param string Source string
 * @param font   Source string's font
 * @param color  Source string's color
 */
+ (NSAttributedString *)attributeStringWithString:(NSString *)string
                                             font:(UIFont *)font
                                            color:(UIColor *)color;

/**
 * Returns an NSAttributedString object.
 *
 * @param string          Source string
 * @param highlightString Highlight string in source string
 * @param stringColor     Source string's color
 * @param highlightColor  Highlight string's color
 * @param font            Source String's color
 */
+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                   highlightString:(NSString *)highlightString
                                       stringColor:(UIColor *)stringColor
                                    highlightColor:(UIColor *)highlightColor
                                              font:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
