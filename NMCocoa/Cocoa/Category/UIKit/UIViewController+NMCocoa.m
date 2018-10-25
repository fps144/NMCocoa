//
//  UIViewController+NMCocoa.m
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import "UIViewController+NMCocoa.h"

@implementation UIViewController (NMCocoa)

+ (UIViewController *)currentVC {
    return [self currentVCFrom:[UIApplication sharedApplication].delegate.window.rootViewController];
}

+ (UINavigationController *)currentNVC {
    return [self currentNVC].navigationController;
}

+ (UINavigationController *)rootNVC {
    id vc = [UIApplication sharedApplication].delegate.window.rootViewController;
    return [vc isKindOfClass:[UINavigationController class]] ? (UINavigationController *)vc : nil;
}

+ (void)popToRootVCAnimated:(BOOL)animated {
    [[self currentVC].navigationController popToRootViewControllerAnimated:animated];
}

#pragma mark - Private
+ (UIViewController *)currentVCFrom:(UIViewController *)vc {
    if (vc.presentedViewController) {
        return [self currentVCFrom:vc.presentedViewController];
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self currentVCFrom:((UINavigationController *)vc).viewControllers.lastObject];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self currentVCFrom:((UITabBarController *)vc).selectedViewController];
    } else {
        return vc;
    }
}

@end
