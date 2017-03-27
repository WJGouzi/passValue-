//
//  wjBlockFirstVC.m
//  传值
//
//  Created by gouzi on 2017/3/27.
//  Copyright © 2017年 王钧. All rights reserved.
//

#import "wjBlockFirstVC.h"
#import "wjBlockSecondVC.h"


@interface wjBlockFirstVC ()

/** name */
@property (nonatomic, strong) UILabel *name;

/** secreat*/
@property (nonatomic, strong) UILabel *secreat;

/** button*/
@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation wjBlockFirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settings];
}

- (void)settings {
    self.title = @"block传值VC1";
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
- (void)loginAction:(UIButton *)loginBtn {
    wjBlockSecondVC *second = [[wjBlockSecondVC alloc] init];
    __block typeof(self) weakSelf = self;
    second.passValueBlock = ^(NSString *name, NSString *secreat) {
        weakSelf.name.text = name;
        weakSelf.secreat.text = secreat;
        if (weakSelf.name.text.length != 0 && weakSelf.secreat.text.length != 0) {
            [weakSelf.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        }
    };
    [self.navigationController pushViewController:second animated:YES];
}

@end
