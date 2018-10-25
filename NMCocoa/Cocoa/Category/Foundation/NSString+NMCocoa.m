//
//  NSString+NMCocoa.m
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import "NSString+NMCocoa.h"
#import <CommonCrypto/CommonDigest.h>
#import <CoreFoundation/CoreFoundation.h>
#import <CoreText/CoreText.h>

@implementation NSString (NMCocoa)

- (NSData *)UTF8data {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)md5Encrypt {
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.UTF8String, (CC_LONG)strlen(self.UTF8String), digest);
    NSMutableString *md5Str = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; ++i) {
        [md5Str appendFormat:@"%02x", digest[i]];
    }
    return md5Str;
}

- (NSString *)base64Encode {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}

- (NSString *)base64Decode {
    return [[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters] encoding:NSUTF8StringEncoding];
}

- (NSString *)transformToPinyin {
    NSMutableString *mStr = [NSMutableString stringWithString:self];
    if (CFStringTransform((__bridge CFMutableStringRef)mStr, NULL, kCFStringTransformToLatin, NO)) {
        CFStringTransform((__bridge CFMutableStringRef)mStr, NULL, kCFStringTransformStripCombiningMarks, NO);
    }
    return mStr.copy;
}

- (CGFloat)widthForFont:(UIFont *)font {
    return [self sizeForFont:font containerSize:CGSizeMake(MAXFLOAT, MAXFLOAT) mode:NSLineBreakByWordWrapping].width;
}

- (CGFloat)heightForFont:(UIFont *)font containerWidth:(CGFloat)width {
    return [self sizeForFont:font containerSize:CGSizeMake(width, MAXFLOAT) mode:NSLineBreakByWordWrapping].height;
}

- (CGSize)sizeForFont:(UIFont *)font containerSize:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result = CGSizeZero;
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    if ([self containsEmoji]) {
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            style.lineBreakMode = lineBreakMode;
            [attributes setObject:style forKey:NSParagraphStyleAttributeName];
        }
        NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:self attributes:attributes];
        CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attrStr);
        result = CTFramesetterSuggestFrameSizeWithConstraints(frameSetter, CFRangeMake(0, (CFIndex)self.length), NULL, size, NULL);
        if (frameSetter) CFRelease(frameSetter);
    } else if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            style.lineBreakMode = lineBreakMode;
            [attributes setObject:style forKey:NSParagraphStyleAttributeName];
        }
        CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attributes context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return CGSizeMake(ceilf(result.width), ceilf(result.height));
}

#pragma mark - Getter
- (BOOL)isEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailPredicate evaluateWithObject:self];
}

- (BOOL)containsEmoji {
    __block BOOL containsEmoji = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        const unichar hs = [substring characterAtIndex:0];
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    containsEmoji = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                containsEmoji = YES;
            }
        } else {
            if (0x2100 <= hs && hs <= 0x27ff) {
                containsEmoji = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                containsEmoji = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                containsEmoji = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                containsEmoji = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                containsEmoji = YES;
            }
        }
    }];
    
    return containsEmoji;
}

- (BOOL)containsChinese {
    for (int i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (c >= 0x4e00 && c <= 0x9fff) {
            return YES;
        }
    }
    return NO;
}

@end
