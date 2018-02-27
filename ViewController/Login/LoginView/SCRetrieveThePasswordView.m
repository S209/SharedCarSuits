//
//  SCRetrieveThePasswordView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCRetrieveThePasswordView.h"
#import "SCManager+CommonMethods.h"
#import "NSString+Predicate.h"
#import "SCManager+MBProgressHUD.h"
@interface SCRetrieveThePasswordView()<UITextFieldDelegate>
@property (nonatomic, weak) UITextField * phoneNumberField;
@property (nonatomic, weak) UITextField * smsVerification;
@property (nonatomic, weak) UIButton * repeateBtn;
@property (nonatomic, weak) UIImageView * stepOneImageView;
@property (nonatomic, weak) UIButton * nextBtn;
@end
@implementation SCRetrieveThePasswordView
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
    phoneNumberLabel.text = @"手机号";
    phoneNumberLabel.textColor = [UIColor sc_colorWith282828];
    phoneNumberLabel.font = [UIFont sy_font16];
    [phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(self.mas_top).with.offset(50);
        make.right.equalTo(self.mas_right).with.offset(-0);
    }];
    
    UITextField * phoneNumberField = [[UITextField alloc] init];
    [self addSubview:phoneNumberField];
    phoneNumberField.tag = 300;
    phoneNumberField.placeholder = @"请输入11位手机号";
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
    
    UITextField * smsVerification = [[UITextField alloc] init];
    [self addSubview:smsVerification];
    self.smsVerification = smsVerification;
    smsVerification.backgroundColor = [UIColor sc_colorWihtf8f8f8];
    NSString * smsVerificationString = @"请输入验证码";
    smsVerification.keyboardType = UIKeyboardTypeNumberPad;
    smsVerification.placeholder = smsVerificationString;
    smsVerification.layer.masksToBounds = YES;
    [smsVerification.layer setCornerRadius:4.0];
    smsVerification.textColor = [UIColor sc_colorWith444444];
    UIView * smsVerificationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 40)];
    smsVerificationView.backgroundColor = [UIColor clearColor];
    smsVerification.leftViewMode = UITextFieldViewModeAlways;    //此句代码较容易忽略
    smsVerification.leftView = smsVerificationView;
    
    
    UIButton * repeateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:repeateBtn];
    self.repeateBtn = repeateBtn;
    repeateBtn.layer.masksToBounds = YES;
    [repeateBtn.layer setCornerRadius:4.0];
    [repeateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.top.equalTo(phoneNumberField.mas_bottom).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    [repeateBtn addTarget:self action:@selector(repeateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    repeateBtn.backgroundColor = [UIColor sc_colorWith6C6DFD];
    repeateBtn.titleLabel.font = [UIFont sy_font14];
    [repeateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [smsVerification mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(repeateBtn.mas_top).with.offset(0);
        make.right.equalTo(repeateBtn.mas_left).with.offset(-5);
        make.height.mas_equalTo(40);
    }];
    
    
    UIButton * nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:nextBtn];
    self.nextBtn = nextBtn;
    [nextBtn addTarget:self action:@selector(nextBtn:) forControlEvents:UIControlEventTouchUpInside];
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.height.mas_equalTo(40);
        make.top.equalTo(smsVerification.mas_bottom).with.offset(120);
    }];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextBtn.backgroundColor = [UIColor sc_colorWith6C6DFD];
    nextBtn.titleLabel.font = [UIFont sy_boldFont16];
    nextBtn.layer.masksToBounds = YES;
    [nextBtn.layer setCornerRadius:4.0];
    
    UIImageView * stepOneImageView = [[UIImageView alloc] init];
    [self addSubview:stepOneImageView];
    self.stepOneImageView = stepOneImageView;
    [self.stepOneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nextBtn.mas_bottom).with.offset(119);
        make.centerX.mas_equalTo(self.nextBtn.centerX);
    }];
}

- (void)setType:(TypeR)type
{
    _type = type;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.type == TypeRetrieveThePassword) {
        [self.repeateBtn setTitle:@"重新发送" forState:UIControlStateNormal];
        [self.stepOneImageView setImage:[UIImage imageNamed:@"find_num_1"]];
        [self.stepOneImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(67.5, 15));
        }];
    }else{
        [self.repeateBtn setTitle:@"发送验证" forState:UIControlStateNormal];
        [self.stepOneImageView setImage:[UIImage imageNamed:@"register_num_1"]];
        [self.stepOneImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(120, 15));
        }];
    }
}

//发送验证码
- (void)repeateBtnClick:(UIButton *)sender
{
    BOOL flag = [self.phoneNumberField.text isPhoneNumber];
    if (flag) {
        if ([_delegate respondsToSelector:@selector(getVerificationCodeWithPhoneNumber:)]) {
            [self.delegate getVerificationCodeWithPhoneNumber:self.phoneNumberField.text];
        }
        [[SCManager shareInstance] countDownWithView:sender];
    }else{
        [SCManager dismissInfo:@"请输入正确电话号码"];
    }
}

- (void)nextBtn:(UIButton *)sender
{
    if (self.smsVerification.text.length > 0) {
        if ([_delegate respondsToSelector:@selector(nextStepWithSMSCode:)]) {
            [self.delegate nextStepWithSMSCode:self.smsVerification.text];
        }
    }else{
          [SCManager dismissInfo:@"请输入验证码"];
    }
}
@end
