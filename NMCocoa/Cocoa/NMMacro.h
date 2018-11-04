//
//  NMMacro.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/23.
//  Copyright © 2018年 南门. All rights reserved.
//

#ifndef NMMacro_h
#define NMMacro_h

#pragma mark - Common
// 弱引用
#define weakObj(obj) __weak __typeof(obj) weak##obj = obj;

// 强引用
#define strongObj(obj) __strong __typeof(weak##obj) strong##obj = weak##obj;

// 判空
#define isNull(obj) (!obj || [obj isKindOfClass:NSNull.class])
#define isNullStr(str) (isNull(str) || ![str isKindOfClass:NSString.class] || str.length <= 0)

// Debug日志
#ifdef DEBUG
#define DebugLog(...) NSLog(@"%s \t Line: %d \n %@ \n", __func__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define DebugLog(...)
#endif

// 单例(接口和实现)
#define Singleton_Interface(className) \
+ (className *)sharedInterface;

#define Singleton_Implementation(className) \
static className *_instance; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}\
\
- (id)mutableCopyWithZone:(NSZone *)zone { \
return _instance; \
}\
+ (className *)sharedInterface \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
}

#pragma mark - System
// 系统版本
#define SystemVersion [[UIDevice currentDevice] systemVersion]

// App版本
#define AppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

// App Build号
#define AppBuildVersion [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleVersion"]

// App BundleId
#define AppBundleId [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"]

// 设备名
#define DeviceName [[UIDevice currentDevice] name]

// 设备类型
#define iPad   UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
#define iPhone UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone

#pragma mark - UI
// RGBA颜色
#define RGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]]
#define ColorFromHex(hex, alpha) RGBAColor((float)((hex & 0xFF0000) >> 16), (float)((hex & 0xFF00) >> 8), (float)(hex & 0xFF), alpha)

// 屏幕宽高
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
#define Screen_Width ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.width)
#define Screen_Height ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.height)
#else
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
#endif

#pragma mark - Math
#define PI 3.141592654
#define Square(x) ((x)*(x))

#endif /* NMMacro_h */
