//
//  ViewController.m
//  test1
//
//  Created by jerry on 2017/8/4.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "wjPostNotificaitonVC.h"
#import "wjAddObserverVC.h"

@interface wjPostNotificaitonVC ()

@end

@implementation wjPostNotificaitonVC

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"test" object:self userInfo:@{@"text" : @"wangjun"}];
    }];
    

    wjAddObserverVC *wjvc = [[wjAddObserverVC alloc] init];
    [self presentViewController:wjvc animated:YES completion:nil];
}



@end
