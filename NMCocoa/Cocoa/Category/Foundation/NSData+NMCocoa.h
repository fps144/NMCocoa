//
//  NSData+NMCocoa.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (NMCocoa)

/**
 * Returns an NSData object from base64 encoded string
 *
 * @param base64EncodedString The encoded string
 */
+ (NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString;

/**
 * Returns an NSString object for base64 encoded.
 */
+ (NSString *)base64EncodedString;

@end

NS_ASSUME_NONNULL_END
