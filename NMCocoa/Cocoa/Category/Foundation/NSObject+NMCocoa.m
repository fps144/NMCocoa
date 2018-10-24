//
//  NSObject+NMCocoa.m
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import "NSObject+NMCocoa.h"
#import <objc/runtime.h>

@implementation NSObject (NMCocoa)

+ (BOOL)hookInstanceMethod:(SEL)originalSel with:(SEL)hookSel {
    Class cls = self;
    Method originalMethod = class_getInstanceMethod(cls, originalSel);
    Method hookMethod = class_getInstanceMethod(cls, hookSel);
    if (!originalMethod || !hookMethod) return NO;
    if (class_addMethod(cls, originalSel, method_getImplementation(hookMethod), method_getTypeEncoding(hookMethod))) {
        class_replaceMethod(cls, hookSel, method_getImplementation(hookMethod), method_getTypeEncoding(hookMethod));
    } else {
        method_exchangeImplementations(originalMethod, hookMethod);
    }
    return YES;
}

+ (BOOL)hookClassMethod:(SEL)originalSel with:(SEL)hookSel {
    return [object_getClass(self) hookInstanceMethod:originalSel with:hookSel];
}

@end
