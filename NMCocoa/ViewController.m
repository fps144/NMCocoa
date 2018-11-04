//
//  ViewController.m
//  NMCocoa
//
//  Created by 南门 on 2018/10/22.
//  Copyright © 2018年 南门. All rights reserved.
//

#import "ViewController.h"
#import "NMCocoa.h"

@interface ViewController ()

@end

@implementation ViewController

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self hookInstanceMethod:@selector(viewDidLoad) with:@selector(h_viewDidLoad)];
        [self hookClassMethod:@selector(superclass) with:@selector(h_superclass)];
    });
}

+ (Class)h_superclass {
    DebugLog(@"hook_class");
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    DebugLog(@"original_instance");
}

- (void)h_viewDidLoad {
    DebugLog(@"hook_instance");
    DebugLog(@"%@", [ViewController superclass]);
}

@end
