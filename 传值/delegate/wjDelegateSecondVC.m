//
//  wjDelegateSecondVC.m
//  传值
//
//  Created by gouzi on 2017/3/27.
//  Copyright © 2017年 王钧. All rights reserved.
//

#import "wjDelegateSecondVC.h"

@interface wjDelegateSecondVC () <UITextFieldDelegate>

/** username*/
@property (nonatomic, strong) UITextField *username;

/** secreat*/
@property (nonatomic, strong) UITextField *secreat;
@end

@implementation wjDelegateSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self UISettings];
}

- (void)UISettings {
    self.title = @"代理传值VC2";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // UI
    UITextField *userTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 100, 250, 30)];
    userTextField.borderStyle = UITextBorderStyleRoundedRect;
    userTextField.placeholder = @"请输入账号名";
    userTextField.delegate = self;
    [self.view addSubview:userTextField];
    self.username = userTextField;
    
    UITextField *secreatTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 200, 250, 30)];
    secreatTextField.borderStyle = UITextBorderStyleRoundedRect;
    secreatTextField.placeholder = @"请输入密码";
    secreatTextField.delegate = self;
    [self.view addSubview:secreatTextField];
    self.secreat = secreatTextField;
    
    UIButton *returnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    returnLogin.frame = CGRectMake(30, 280, 150, 30);
    returnLogin.backgroundColor = [UIColor redColor];
    [returnLogin setTitle:@"返回登录" forState:UIControlStateNormal];
    returnLogin.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [returnLogin addTarget:self action:@selector(returnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnLogin];
}

#pragma mark - btnAction
- (void)returnAction:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(secdonVCReturnUsername:secreat:)]) {
        [self.delegate secdonVCReturnUsername:self.username.text secreat:self.secreat.text];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}




@end
