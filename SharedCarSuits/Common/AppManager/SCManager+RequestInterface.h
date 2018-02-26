//
//  SCManager+RequestInterface.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/20.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCManager.h"

@interface SCManager (RequestInterface)

/**
 注册获取验证码
 @param phoneNumber <#phoneNumber description#>
 */
- (void)getRegisteredVerificationCodeWithPhoneNumber:(NSString *)phoneNumber success:(SuccessBlock)success
                                              notice:(OptionBlock)notice
                                             failure:(FailureBlock)failure;

/**
 登录

 @param loginName 账号
 @param passWord 密码
 */
- (void)logInWithLoginName:(NSString *)loginName passWord:(NSString *)passWord success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;

/**
 验证

 @param phoneNum 手机号
 @param code 短信号码
 */
- (void)verificationWithPhoneNum:(NSString *)phoneNum code:(NSString *)code success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;

/**
 注册

 @param phoneNum 手机号
 @param passWord 密码
 @param carModel 车的型号
 @param carNum 车牌号
 */
- (void)registeredWithPhoneNum:(NSString *)phoneNum passWord:(NSString *)passWord
                      carModel:(NSString *)carModel carNum:(NSString *)carNum success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;
/**
 找回密码

 @param loginName <#loginName description#>
 @param passWord <#passWord description#>
 */
- (void)retrieveThePasswordWithloginName:(NSString *)loginName passWord:(NSString *)passWord success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;

///keleapp/car/carList.jspx
/*
 我的车库
 */
- (void)myGarageWithSuccess:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;


/**
 编辑个人信息

 @param realNameString 用户姓名
 @param headUrlData 用户头像
 */
- (void)editUserInfoWithRealName:(NSString *)realNameString HeadUrl:(NSData *)headUrlData success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;
@end
