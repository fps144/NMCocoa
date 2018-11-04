//
//  NMCocoa.h
//  NMCocoa
//
//  Created by Songyu on 2018/11/4.
//  Copyright © 2018 南门. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NMCocoa : NSTimer

/**
 一个不会引发循环引用的timer。（必要时需搭配 weakObj(self) 和 weakObj(self) 使用）

 @param interval 时间间隔
 @param repeats  是否重复
 @param block    要执行的操作block
 @return         timer对象
 */
+ (NSTimer *)nm_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                       repeats:(BOOL)repeats
                                         block:(void(^)(void))block;

@end

NS_ASSUME_NONNULL_END
