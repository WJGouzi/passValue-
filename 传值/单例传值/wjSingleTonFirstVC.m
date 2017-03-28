//
//  wjSingleTonFirstVC.m
//  传值
//
//  Created by gouzi on 2017/3/27.
//  Copyright © 2017年 王钧. All rights reserved.
//

#import "wjSingleTonFirstVC.h"
#import "wjSingleTonSecondVC.h"
#import "wjSingleTon.h"


@interface wjSingleTonFirstVC ()

/** name*/
@property (nonatomic, strong) UILabel *name;

/** secreat */
@property (nonatomic, strong) UILabel *secreat;

/** singleTon*/
@property (nonatomic, strong) wjSingleTon *singleTon;

@end

@implementation wjSingleTonFirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settings];
}

// 反向传值--在界面将要出现的时候就开始赋值
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
    self.name.text = self.singleTon.name;
    self.secreat.text = self.singleTon.secreat;
}

#pragma mark - 懒加载
- (wjSingleTon *)singleTon {
    if (!_singleTon) {
        _singleTon = [wjSingleTon shareSingleTon];
        _singleTon.name = nil;
        _singleTon.secreat = nil;
    }
    return _singleTon;
}


- (void)settings {
    self.title = @"单例VC1";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // UI界面
    UILabel *userLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 150, 250, 30)];
    userLabel.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:userLabel];
    self.name = userLabel;
    
    UILabel *secreatLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 200, 250, 30)];
    secreatLabel.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:secreatLabel];
    self.secreat = secreatLabel;
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(30, 280, 100, 30);
    [loginBtn setTitle:@"注册登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor redColor]];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
//    self.loginBtn = loginBtn;
}

- (void)loginAction:(UIButton *)btn {
    wjSingleTonSecondVC *second = [[wjSingleTonSecondVC alloc] init];
    [self.navigationController pushViewController:second animated:YES];
}



@end
