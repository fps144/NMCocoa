//
//  UIView+NMCocoa.m
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import "UIView+NMCocoa.h"

@implementation UIView (NMCocoa)

#pragma mark - Public
- (UIImage *)snapshotImage {
    @autoreleasepool {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, [UIScreen mainScreen].scale);
        UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return snapshot;
    }
}

- (void)removeAllSubviews {
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

- (void)roundingCorners:(UIRectCorner)corner cornerRadius:(CGFloat)cornerRadius {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
    [self.layer layoutIfNeeded];
}

- (void)roundingCorners:(UIRectCorner)corner cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    self.layer.masksToBounds = YES;
    self.layer.mask = maskLayer;
    
    CAShapeLayer *borderMaskLayer = [CAShapeLayer layer];
    borderMaskLayer.path = path.CGPath;
    borderMaskLayer.fillColor = [UIColor clearColor].CGColor;
    borderMaskLayer.strokeColor = borderColor.CGColor;
    borderMaskLayer.lineWidth = borderWidth;
    [self.layer addSublayer:borderMaskLayer];
    
    [self.layer layoutIfNeeded];
}

#pragma mark - Getter
- (CGFloat)left    {return self.origin.x;}
- (CGFloat)top     {return self.origin.y;}
- (CGFloat)right   {return self.left + self.size.width;}
- (CGFloat)bottom  {return self.top + self.size.height;}
- (CGFloat)width   {return self.size.width;}
- (CGFloat)height  {return self.size.height;}
- (CGFloat)centerX {return self.center.x;}
- (CGFloat)centerY {return self.center.y;}
- (CGPoint)origin  {return self.frame.origin;}
- (CGSize)size     {return self.frame.size;}

- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = view.nextResponder;
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (UIView *)firstResponder {
    if (self.isFirstResponder) return self;
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView firstResponder];
        if (firstResponder) return firstResponder;
    }
    return nil;
}

#pragma mark - Setter
- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end
