//
//  wjPropertyFirstVC.m
//  传值
//
//  Created by gouzi on 2017/3/27.
//  Copyright © 2017年 王钧. All rights reserved.
//

#import "wjPropertyFirstVC.h"
#import "wjPropertySecondVC.h"


@interface wjPropertyFirstVC ()

/** name*/
@property (nonatomic, strong) UITextField *name;
/** secreat*/
@property (nonatomic, strong) UITextField *secreat;

@end

@implementation wjPropertyFirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settings];
}


- (void)settings {
    self.title = @"属性传值VC1";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // UI
    UITextField *userTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 100, 250, 30)];
    userTextField.borderStyle = UITextBorderStyleRoundedRect;
    userTextField.placeholder = @"请输入账号名";
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
    [returnLogin setTitle:@"注册登录" forState:UIControlStateNormal];
    returnLogin.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [returnLogin addTarget:self action:@selector(returnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnLogin];
}

- (void)returnAction:(UIButton *)returnBtn {
    wjPropertySecondVC *second = [[wjPropertySecondVC alloc] init];
    second.username = self.name.text;
    second.secreat = self.secreat.text;
    [self.navigationController pushViewController:second animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}




@end
