//
//  SCManager+RequestInterface.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/20.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCManager.h"
@class SCNetworkMultiDataObj;
@interface SCManager (RequestInterface)

/**
 注册获取验证码(完)
 @param phoneNumber <#phoneNumber description#>
 */
- (void)getRegisteredVerificationCodeWithPhoneNumber:(NSString *)phoneNumber success:(SuccessBlock)success
                                              notice:(OptionBlock)notice
                                             failure:(FailureBlock)failure;

/**
 登录(完)

 @param loginName 账号
 @param passWord 密码
 */
- (void)logInWithLoginName:(NSString *)loginName passWord:(NSString *)passWord success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;

/**
 验证(完)

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
 */
- (void)editUserInfoWithConstructingBodyWithBlock:(NetworkRequestFormDataBlock)block success:(SuccessBlock)success failure:(FailureBlock)failure;


/**
 我的优惠券(完)

 @param couponId 用户ID
 @param length 请求条数
 */
- (void)myCouponListWithId:(NSString *)couponId andLength:(NSString *)length success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;


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

///keleapp/car/carAdd.jspx (完)
- (void)myGarageCarAddWithCarNum:(NSString *)carNum carModel:(NSString *)carModel success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;

/**
 我的车库删除(完)
 /keleapp/car/carDelete.jspx
 */
- (void)myGarageDeleteWithCarId:(NSString *)carId success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;

//keleapp/car/carDefault.jspx
- (void)myGarageCarDefaultWithCarId:(NSString *)userId success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;


//(完)
- (void)couponReceiveListWithLastCouponId:(NSString *)lastCouponId length:(NSString *)length success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;

//(完)
- (void)couponReceiveWithCouponId:(NSString *)couponId success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;
//(完)
- (void)allCarBrandSuccess:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;



/**
 门店列表(完)
 @param shopId 门店id
 @param length 长度 10
 @param location 经纬度
 */
- (void)shopListWithId:(NSString *)shopId length:(NSString *)length location:(NSString *)location
success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;



/**
 默认门店
 */
- (void)shopDefaultWithId:(NSString *)shopId success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;

/**
 我要预约
 */
- (void)makeAnAppointmentWithShopId:(NSString *)shopId orderType:(NSString *)orderType projectIds:(NSString *)projectIds carId:(NSString *)carId date:(NSString *)date success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;

/**
 预约订单-今日/明日时间列表
 */
- (void)appointmentOrderTodayOrTodayListWithShopId:(NSString *)shopId orderType:(NSString *)orderType carId:(NSString *)carId timeType:(NSString *)timeType success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;

/**
  预约订单—今日时间+ 服务项目
 */
- (void)appointmentOrderWithShopId:(NSString *)shopId orderType:(NSString *)orderType carId:(NSString *)carId success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;


/**
 获取首页的Banner
 */
- (void)getHomeBannerListWithSuccess:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;


//SCUrl_OrderList
- (void)getOrderListWithOrderState:(NSInteger)orderstate length:(NSInteger)length createTime:(NSString *)createTime success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;
@end
