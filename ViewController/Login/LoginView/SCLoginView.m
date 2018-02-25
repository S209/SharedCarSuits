//
//  SCLoginView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCLoginView.h"
#import <Masonry.h>
#import "NSString+Predicate.h"
#import "SCManager+MBProgressHUD.h"
@interface SCLoginView()<UITextFieldDelegate>
@property (nonatomic, weak) UILabel * phoneNumberLabel;
@property (nonatomic, weak) UITextField * phoneNumberField;
@property (nonatomic, weak) UILabel * loginPasswordLabel;
@property (nonatomic, weak) UITextField * loginPasswordField;
@property (nonatomic, weak) UIImageView * tipsImage;
@property (nonatomic, weak) UIButton * loginBtn;
@property (nonatomic, weak) UIButton * registerBtn;
//@property (nonatomic, weak) UILabel * findPasswordLabel;

@end
@implementation SCLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    
    self.size = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    
    UILabel * phoneNumberLabel = [[UILabel alloc] init];
    [self addSubview:phoneNumberLabel];
    self.phoneNumberLabel = phoneNumberLabel;
    phoneNumberLabel.text = @"手机号";
    phoneNumberLabel.font = [UIFont sy_font16];
    phoneNumberLabel.textColor = [UIColor sc_colorWith282828];
    [phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(self.mas_top).with.offset(60);
        make.right.equalTo(self.mas_right).with.offset(-0);
    }];
    
    UITextField * phoneNumberField = [[UITextField alloc] init];
    [self addSubview:phoneNumberField];
    phoneNumberField.tag = 300;
    self.phoneNumberField = phoneNumberField;
    phoneNumberField.textColor = [UIColor sc_colorWith444444];
    phoneNumberField.backgroundColor = [UIColor sc_colorWihtf8f8f8];
    UIView * leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 40)];
    leftView.backgroundColor = [UIColor clearColor];
    phoneNumberField.leftViewMode = UITextFieldViewModeAlways;    //此句代码较容易忽略
    phoneNumberField.leftView = leftView;
    phoneNumberField.keyboardType = UIKeyboardTypeNumberPad;
    [phoneNumberField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneNumberLabel.mas_bottom).with.offset(15);
        make.left.equalTo(phoneNumberLabel.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.height.mas_equalTo(40);
    }];
    phoneNumberField.delegate = self;
    
    
    UILabel * loginPasswordLabel = [[UILabel alloc] init];
    [self addSubview:loginPasswordLabel];
    self.loginPasswordLabel = loginPasswordLabel;
    loginPasswordLabel.text = @"登录密码";
    loginPasswordLabel.font = [UIFont sy_font16];
    loginPasswordLabel.textColor = [UIColor sc_colorWith282828];
    [loginPasswordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneNumberField.mas_left).with.offset(0);
        make.top.equalTo(phoneNumberField.mas_bottom).with.offset(20);
    }];
    
    UITextField * loginPasswordField = [[UITextField alloc] init];
    [self addSubview:loginPasswordField];
    loginPasswordField.tag = 400;
    self.loginPasswordField = loginPasswordField;
    loginPasswordField.delegate = self;
    loginPasswordField.secureTextEntry = YES;
    
    
    loginPasswordField.backgroundColor = [UIColor sc_colorWihtf8f8f8];
    UIView * loginPasswordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 40)];
    loginPasswordView.backgroundColor = [UIColor clearColor];
    loginPasswordField.leftViewMode = UITextFieldViewModeAlways;    //此句代码较容易忽略
    loginPasswordField.leftView = loginPasswordView;
   
    [loginPasswordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneNumberField.mas_left).with.offset(0);
        make.top.equalTo(loginPasswordLabel.mas_bottom).with.offset(15);
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.height.mas_equalTo(40);
    }];
    
    UIImageView * tipsImage = [[UIImageView alloc] init];
    [self addSubview:tipsImage];
    self.tipsImage = tipsImage;
    tipsImage.hidden = YES;
    [tipsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(loginPasswordLabel.mas_left).with.offset(0);
        make.top.equalTo(loginPasswordField.mas_bottom).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(180, 25));
    }];
    
    
    UIButton * loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(160, 40));
        make.top.equalTo(loginPasswordField.mas_bottom).with.offset(106);
    }];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont sy_boldFont16];
    loginBtn.backgroundColor = [UIColor sc_colorWith6C6DFD];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(160, 40));
        make.top.equalTo(loginPasswordField.mas_bottom).with.offset(106);
    }];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont sy_boldFont16];
    registerBtn.backgroundColor = [UIColor sc_colorWithFC8739];
    [registerBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)loginBtnClick:(UIButton *)sender
{
    self.phoneNumberField.text = @"18210234591";
    self.loginPasswordField.text = @"12341aaa";
    if ([self.phoneNumberField.text isPhoneNumber] && self.loginPasswordField.text.length > 0) {
        if ([_delegate respondsToSelector:@selector(loginViewLoginWithAccount:password:)]) {
            [self.delegate loginViewLoginWithAccount:self.phoneNumberField.text password:self.loginPasswordField.text];
        }
    }
    
    if (![self.phoneNumberField.text isPhoneNumber]) {
        [SCManager dismissInfo:@"请输入正确的电话号码"];
    }else
    if (self.loginPasswordField.text.length == 0) {
        [SCManager dismissInfo:@"请输入密码"];
    }
}


- (void)registerBtnClick:(UIButton *)sender
{
    if ([_delegate respondsToSelector:@selector(loginViewWithRegister)]) {
        [self.delegate loginViewWithRegister];
    }
}

- (void)forgetPassword
{
    if ([_delegate respondsToSelector:@selector(forgetPassword)]) {
        [self.delegate forgetPassword];
    }
}
#pragma mark UITextFieldDelegate
-(BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string]; //得到输入框的内容
   
    
    if (([toBeString length] > 11)&& textField.tag == 300) { //如果输入框内容大于20则弹出警告

        return NO;
    }else if (textField.tag == 400){
        
    }
    return YES;
}

@end
