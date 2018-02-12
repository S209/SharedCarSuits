//
//  NSString+Predicate.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/12.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Predicate)
//是否是密码格式
- (BOOL)isPassword;
//是否是手机号格式
- (BOOL)isPhoneNumber;
//是否是邮箱格式
- (BOOL)isEmail;
//是否是验证码格式
- (BOOL)isVerificationCode;
//是否是数字
- (BOOL)isNumber;
//是否可以打电话
- (BOOL)canTel;
//是否以中文和应为显示
- (BOOL)isChineseOrABCBegin;
//验证密码强度
- (WPPasswordStrengthType)passWordStrength;
@end
