//
//  NSString+Predicate.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/12.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "NSString+Predicate.h"

@implementation NSString (Predicate)
//是否是密码格式
- (BOOL)isPassword
{
    NSPredicate *pwdPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"\\w{6,20}"];
    return [pwdPre evaluateWithObject:self];
}
//是否是手机号格式
- (BOOL)isPhoneNumber
{
    NSPredicate *phonePre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"1\\d{10}"];
    return [phonePre evaluateWithObject:self];
}
//是否是邮箱格式
- (BOOL)isEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

//是否是验证码格式
- (BOOL)isVerificationCode
{
    NSString *emailRegex = @"[0-9]{4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}
//是否是数字
- (BOOL)isNumber
{
    NSString *emailRegex = @"[0-9]+";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

//是否可以打电话
- (BOOL)canTel
{
    NSString* telStr = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (!(telStr && telStr.length)) {
        return NO;
    }
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",telStr]]];
}

//是否以中文和应为显示
- (BOOL)isChineseOrABCBegin
{
    NSString *emailRegex = @"[a-zA-Z\u4e00-\u9fa5]+";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}
//验证密码强度
- (WPPasswordStrengthType)passWordStrength
{
    if ([self isModeratePassword]) {
        return WPPasswordStrengthTypeModerate;
    } else if ([self isStrongPassword]) {
        return WPPasswordStrengthTypeStrong;
    } else {
        return WPPasswordStrengthTypeWeak;
    }
}

- (BOOL)isModeratePassword
{
    NSString *passwordPre = @"(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])[a-zA-Z0-9\\S]{6,8}";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordPre];
    return [passwordTest evaluateWithObject:self];
}

- (BOOL)isStrongPassword
{
    NSString *passwordPre = @"(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])[a-zA-Z0-9\\S]{9,}";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordPre];
    return [passwordTest evaluateWithObject:self];
}

@end
