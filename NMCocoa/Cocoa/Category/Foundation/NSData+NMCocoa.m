//
//  NSData+NMCocoa.m
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import "NSData+NMCocoa.h"

@implementation NSData (NMCocoa)

- (NSString *)string {
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

- (NSString *)base64EncodedString {
    return [self base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}

+ (NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString {
    return [[NSData alloc] initWithBase64EncodedString:base64EncodedString options:NSDataBase64DecodingIgnoreUnknownCharacters];
}

@end
