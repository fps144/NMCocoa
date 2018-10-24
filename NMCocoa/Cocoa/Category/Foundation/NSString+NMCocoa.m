//
//  NSString+NMCocoa.m
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import "NSString+NMCocoa.h"
#import<CommonCrypto/CommonDigest.h>

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

#pragma mark - Getter
- (BOOL)isEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailPredicate evaluateWithObject:self];
}

@end
