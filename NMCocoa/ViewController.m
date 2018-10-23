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



- (void)viewDidLoad {
    [super viewDidLoad];
    DebugLog(@"xxxx---xxxx");
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        <#code to be executed once#>
    });
    // Do any additional setup after loading the view, typically from a nib.
}


@end
