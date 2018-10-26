//
//  UIButton+NMCocoa.m
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import "UIButton+NMCocoa.h"
#import "UIImage+NMCocoa.h"

@implementation UIButton (NMCocoa)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIImage imageWithColor:backgroundColor size:CGSizeMake(1.f, 1.f)] forState:state];
}

- (void)verticalCenterImageAndTitle:(CGFloat)spacing {
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(-(totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, -(totalHeight - titleSize.height), 0);
}

- (void)horizontalCenterTitleAndImage:(CGFloat)spacing {
    CGSize imageSize = self.imageView.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, 0.0, imageSize.width + spacing * 0.5f);
    CGSize titleSize = self.titleLabel.frame.size;
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + spacing * 0.5f, 0.0, -titleSize.width);
}

- (void)horizontalCenterImageAndTitle:(CGFloat)spacing; {
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, -spacing * 0.5f);
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, -spacing * 0.5f, 0.0, 0.0);
}

- (void)horizontalCenterTitleAndImageLeft:(CGFloat)spacing {
    CGSize imageSize = self.imageView.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, 0.0, 0.0);
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, -spacing, 0.0,  imageSize.width);
}

- (void)horizontalCenterTitleAndImageRight:(CGFloat)spacing {
    CGSize imageSize = self.imageView.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, 0.0, 0.0);
    CGSize titleSize = self.titleLabel.frame.size;
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + imageSize.width + spacing, 0.0, -titleSize.width);
}

@end
