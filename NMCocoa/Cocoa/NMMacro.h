//
//  NMMacro.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/23.
//  Copyright © 2018年 南门. All rights reserved.
//

#ifndef NMMacro_h
#define NMMacro_h

/** 弱引用 */
#define weakSelf __weak __typeof(self) weak##self = self;
/** 强引用 */
#define strongSelf __strong __typeof(weak##self) strong##self = weak##self;

#ifdef DEBUG
#define DebugLog(...) NSLog(@"%s Line:%d \n %@ \n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
    #define DebugLog(...)
#endif

#endif /* NMMacro_h */
