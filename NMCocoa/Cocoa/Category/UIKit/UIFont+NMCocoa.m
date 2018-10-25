//
//  UIFont+NMCocoa.m
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import "UIFont+NMCocoa.h"

@implementation UIFont (NMCocoa)

+ (UIFont *)mediumFontOfSize:(CGFloat)size {
    if (@available(iOS 8.2, *)) {
        return  [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
    } else {
        return  [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
    }
}

@end
