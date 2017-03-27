//
//  wjPropertySecondVC.m
//  传值
//
//  Created by gouzi on 2017/3/27.
//  Copyright © 2017年 王钧. All rights reserved.
//

#import "wjPropertySecondVC.h"
#import "wjPropertyFirstVC.h"

@interface wjPropertySecondVC ()

@end

@implementation wjPropertySecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settings];
}



- (void)settings {
    self.title = @"属性传值VC2";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // UI界面
    UILabel *userLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 150, 250, 30)];
    userLabel.backgroundColor = [UIColor purpleColor];
    userLabel.text = self.username;
    [self.view addSubview:userLabel];
    //    self.name = userLabel;
    
    UILabel *secreatLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 200, 250, 30)];
    secreatLabel.backgroundColor = [UIColor purpleColor];
    secreatLabel.text = self.secreat;
    [self.view addSubview:secreatLabel];
    //    self.secreat = secreatLabel;
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(30, 280, 100, 30);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor redColor]];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    //    self.loginBtn = loginBtn;
}



- (void)loginAction:(UIButton *)loginBtn {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
