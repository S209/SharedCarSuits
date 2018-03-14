//
//  SCFindPasswordUpatePasswordView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCFindPasswordUpatePasswordView.h"
#import "SCManager+MBProgressHUD.h"
@interface SCFindPasswordUpatePasswordView();
@property (nonatomic, weak) UITextField * setupPasswordField;
@property (nonatomic, weak) UITextField * repeateInputField;
@property (nonatomic, weak) UIImageView * stepTwoImageView;
@property (nonatomic, weak) UIButton * completeBtn;
@end
@implementation SCFindPasswordUpatePasswordView

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
    
    UILabel * setupPasswordLabel = [[UILabel alloc] init];
    [self addSubview:setupPasswordLabel];
    setupPasswordLabel.text = @"设置密码";
    [setupPasswordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(self.mas_top).with.offset(50);
        make.right.equalTo(self.mas_right).with.offset(-0);
    }];
    setupPasswordLabel.font = [UIFont sy_font16];
    setupPasswordLabel.textColor = [UIColor sc_colorWith282828];
    
    
    UITextField * setupPasswordField = [[UITextField alloc] init];
    [self addSubview:setupPasswordField];
    self.setupPasswordField = setupPasswordField;
    setupPasswordField.backgroundColor = [UIColor sc_colorWithf8f8f8];
    NSString * setupPasswordString = @"请输入密码";
    setupPasswordField.keyboardType = UIKeyboardTypeNumberPad;
    setupPasswordField.placeholder = setupPasswordString;
    setupPasswordField.layer.masksToBounds = YES;
    [setupPasswordField.layer setCornerRadius:4.0];
    setupPasswordField.textColor = [UIColor sc_colorWith444444];
    UIView * setupPasswordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 40)];
    setupPasswordView.backgroundColor = [UIColor clearColor];
    setupPasswordField.leftViewMode = UITextFieldViewModeAlways;    //此句代码较容易忽略
    setupPasswordField.leftView = setupPasswordView;
    
    [setupPasswordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(setupPasswordLabel.mas_bottom).with.offset(15);
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.height.mas_equalTo(40);
    }];
    
    
    UILabel * repeateInput = [[UILabel alloc] init];
    [self addSubview:repeateInput];
    [repeateInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(setupPasswordField.mas_bottom).with.offset(20);
        make.right.equalTo(self.mas_right).with.offset(-0);
    }];
    repeateInput.text = @"再次输入";
    repeateInput.font = [UIFont sy_font16];
    repeateInput.textColor = [UIColor sc_colorWith282828];
    
    UITextField * repeateInputField = [[UITextField alloc] init];
    [self addSubview:repeateInputField];
    self.repeateInputField = repeateInputField;
    repeateInputField.placeholder = @"请再次输入密码";
    repeateInputField.keyboardType = UIKeyboardTypeNumberPad;
    [repeateInputField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.top.equalTo(repeateInput.mas_bottom).with.offset(15);
        make.height.mas_equalTo(40);
    }];
    UIView * repeateInputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 40)];
    setupPasswordView.backgroundColor = [UIColor clearColor];
    repeateInputField.leftViewMode = UITextFieldViewModeAlways;    //此句代码较容易忽略
    repeateInputField.leftView = repeateInputView;
    
    repeateInputField.backgroundColor = [UIColor sc_colorWithf8f8f8];
    
    
    UIButton * completeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:completeBtn];
    self.completeBtn = completeBtn;
    [completeBtn addTarget:self action:@selector(completeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [completeBtn setTitle:@"完成" forState:UIControlStateNormal];
    completeBtn.backgroundColor = [UIColor sc_colorWith6C6DFD];
    completeBtn.titleLabel.font = [UIFont sy_font16];
    completeBtn.layer.masksToBounds = YES;
    [completeBtn.layer setCornerRadius:4.0];
    [completeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.height.mas_equalTo(40);
        make.top.equalTo(repeateInputField.mas_bottom).with.offset(85);
    }];
    
    UIImageView * stepTwoImageView = [[UIImageView alloc] init];
    [self addSubview:stepTwoImageView];
    self.stepTwoImageView = stepTwoImageView;
}

- (void)setUpdate:(UpdateType)update
{
    _update = update;
    if (update == UpdateTypeRegister) {
        [self.stepTwoImageView setImage:[UIImage imageNamed:@"register_num_2"]];
        [self.stepTwoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(120, 15));
            make.top.equalTo(self.completeBtn.mas_bottom).with.offset(119);
            make.centerX.mas_equalTo(self.completeBtn.centerX);
        }];
    }else{
        [self.stepTwoImageView setImage:[UIImage imageNamed:@"find_num_2"]];
        [self.stepTwoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(67.5, 15));
            make.top.equalTo(self.completeBtn.mas_bottom).with.offset(119);
            make.centerX.mas_equalTo(self.completeBtn.centerX);
        }];
    }
}

- (void)completeBtnClick
{
    
    if ([self.setupPasswordField.text isQualified] && [self.repeateInputField.text isQualified])
    {
        if ([self.setupPasswordField.text isEqualToString:self.repeateInputField.text]) {
            if ([_deleate respondsToSelector:@selector(completeWithPassword:)]) {
                [self.deleate completeWithPassword:self.setupPasswordField.text];
            }
        }else{
            [SCManager dismissInfo:@"两次密码不一样"];
        }
    }else{
            [SCManager dismissInfo:@"密码是8-16位，英文+数字"];
    }
}
@end
