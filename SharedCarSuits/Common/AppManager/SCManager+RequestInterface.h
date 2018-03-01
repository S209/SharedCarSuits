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



#pragma mark 我的
/**
 编辑个人信息

 @param realNameString 用户姓名
 @param headUrlData 用户头像
 */
- (void)editUserInfoWithRealName:(NSString *)realNameString HeadUrl:(NSData *)headUrlData success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;


/**
 我的优惠券(完)

 @param couponId 用户ID
 @param length 请求条数
 */
- (void)myCouponListWithId:(NSString *)couponId andLength:(NSString *)length success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;

///keleapp/car/carList.jspx
/*
 我的车库 (完)
 */
- (void)myGarageWithId:(NSString *)userId andLength:(NSString *)length success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;


/**
 我的车库编辑

 @param carId <#carId description#>
 @param carModel <#carModel description#>
 @param carNum <#carNum description#>
 */
- (void)myGarageEditWithCarId:(NSString *)carId carModel:(NSString *)carModel carNum:(NSString *)carNum success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;
/**
 我的车库删除
 /keleapp/car/carDelete.jspx
 */
- (void)myGarageDeleteWithCarId:(NSString *)carId success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;
//keleapp/car/carDefault.jspx
- (void)myGarageCarDefaultWithCarId:(NSString *)userId success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;
///keleapp/car/carAdd.jspx
- (void)myGarageCarAddWithCarNum:(NSString *)carNum carModel:(NSString *)carModel success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;

///keleapp/coupon/couponReceiveList.jspx
- (void)couponReceiveListWithLastCouponId:(NSString *)lastCouponId length:(NSString *)length success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;

///keleapp/coupon/couponReceive.jspx
- (void)couponReceiveWithCouponId:(NSString *)couponId success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;
@end
