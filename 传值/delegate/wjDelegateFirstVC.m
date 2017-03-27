//
//  wjDelegateFirstVC.m
//  传值
//
//  Created by gouzi on 2017/3/27.
//  Copyright © 2017年 王钧. All rights reserved.
//

#import "wjDelegateFirstVC.h"
#import "wjDelegateSecondVC.h"


@interface wjDelegateFirstVC () <wjDelegateSecondVCDelegate>

/** name*/
@property (nonatomic, strong) UILabel *name;

/** secreat*/
@property (nonatomic, strong) UILabel *secreat;

/** button*/
@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation wjDelegateFirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settings];
}

- (void)settings {
    self.title = @"代理传值VC1";
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
    self.loginBtn = loginBtn;
}

#pragma mark - loginAction
- (void)loginAction:(UIButton *)btn {
    wjDelegateSecondVC *secondVC = [[wjDelegateSecondVC alloc] init];
    secondVC.delegate = self;
    [self.navigationController pushViewController:secondVC animated:YES];
}

#pragma mark - 代理传值
- (void)secdonVCReturnUsername:(NSString *)username secreat:(NSString *)secreat {
    self.name.text = username;
    self.secreat.text = secreat;
    if (self.name.text.length != 0 && self.secreat.text.length != 0) {
        [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    }
}



@end
