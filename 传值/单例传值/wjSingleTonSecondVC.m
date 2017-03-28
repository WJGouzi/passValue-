//
//  wjSingleTonSecondVC.m
//  传值
//
//  Created by gouzi on 2017/3/27.
//  Copyright © 2017年 王钧. All rights reserved.
//

#import "wjSingleTonSecondVC.h"
#import "wjSingleTon.h"

@interface wjSingleTonSecondVC ()

/** name*/
@property (nonatomic, strong) UITextField *name;
/** secreat*/
@property (nonatomic, strong) UITextField *secreat;
@end

@implementation wjSingleTonSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settings];
}

- (void)settings {
    self.title = @"单例VC2";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // UI
    UITextField *userTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 100, 250, 30)];
    userTextField.borderStyle = UITextBorderStyleRoundedRect;
    userTextField.placeholder = @"请输入账号名";
    userTextField.spellCheckingType = UITextSpellCheckingTypeNo;
    [self.view addSubview:userTextField];
    self.name = userTextField;
    
    UITextField *secreatTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 200, 250, 30)];
    secreatTextField.borderStyle = UITextBorderStyleRoundedRect;
    secreatTextField.placeholder = @"请输入密码";
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

- (void)returnAction:(UIButton *)btn {
    wjSingleTon *singleTon = [wjSingleTon shareSingleTon];
    singleTon.name = self.name.text;
    singleTon.secreat = self.secreat.text;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
