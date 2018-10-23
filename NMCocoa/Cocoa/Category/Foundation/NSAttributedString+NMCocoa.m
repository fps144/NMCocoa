//
//  NSAttributedString+NMCocoa.m
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import "NSAttributedString+NMCocoa.h"

@implementation NSAttributedString (NMCocoa)

+ (NSAttributedString *)attributeStringWithString:(NSString *)string font:(UIFont *)font color:(UIColor *)color {
    return !string.length ? [[NSAttributedString alloc] init] : [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:color}];
    
}

+ (NSAttributedString *)attributedStringWithString:(NSString *)string highlightString:(NSString *)highlightString stringColor:(UIColor *)stringColor highlightColor:(UIColor *)highlightColor font:(UIFont *)font {
    if (!string.length) return [[NSAttributedString alloc] init];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:stringColor}];
    if (!highlightString.length) return attrStr;
    NSRange range = [string rangeOfString:highlightString];
    [attrStr addAttributes:@{NSForegroundColorAttributeName : highlightColor} range:range];
    return attrStr.copy;
}

@end
