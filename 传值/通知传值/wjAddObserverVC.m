//
//  wjViewController.m
//  test1
//
//  Created by jerry on 2017/8/4.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "wjAddObserverVC.h"

@interface wjAddObserverVC ()

@property (nonatomic, strong) UILabel *name;

@end

@implementation wjAddObserverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    NSLog(@"Thread:%@",[NSThread currentThread]);
    
    // UI界面
    UILabel *userLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 150, 250, 30)];
    userLabel.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:userLabel];
    self.name = userLabel;

    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:@"test" object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)notification:(NSNotification *)notification {
    NSLog(@"%@----%@", [NSThread currentThread], notification.userInfo);
    self.name.text = notification.userInfo[@"text"];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
