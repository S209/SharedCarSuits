//
//  SCRetrieveThePasswordView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCRetrieveThePasswordView.h"

@interface SCRetrieveThePasswordView()<UITextFieldDelegate>
@property (nonatomic, weak) UITextField * phoneNumberField;
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
    
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:smsVerificationString];
    [placeholder addAttribute:NSForegroundColorAttributeName
                        value:[UIColor sc_colorWith444444]
                        range:NSMakeRange(0, smsVerificationString.length)];
    [placeholder addAttribute:NSFontAttributeName
                        value:[UIFont sy_font14]
                        range:NSMakeRange(0, smsVerificationString.length)];
    smsVerification.attributedPlaceholder = placeholder;
    
    
    UIButton * repeateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:repeateBtn];
    [repeateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.top.equalTo(phoneNumberField.mas_bottom).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    [repeateBtn addTarget:self action:@selector(repeateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    repeateBtn.backgroundColor = [UIColor sc_colorWith6C6DFD];
    [repeateBtn setTitle:@"重新发送" forState:UIControlStateNormal];
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
}



- (void)repeateBtnClick:(UIButton *)sender
{
    
    
}

- (void)nextBtn:(UIButton *)sender
{
    if ([_delegate respondsToSelector:@selector(nextStep)]) {
        [self.delegate nextStep];
    }
}
@end
