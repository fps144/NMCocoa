//
//  NSTimer+NMCocoa.m
//  NMCocoa
//
//  Created by Songyu on 2018/11/4.
//  Copyright © 2018 南门. All rights reserved.
//

#import "NSTimer+NMCocoa.h"

@implementation NSTimer (NMCocoa)

+ (NSTimer *)nm_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(void))block {
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(nm_scheduledTimerBlock:) userInfo:[block copy] repeats:repeats];
}

+ (void)nm_scheduledTimerBlock:(NSTimer *)timer {
    dispatch_block_t block = timer.userInfo;
    if (block) block();
}

@end
