//
//  SCRequestUrlConst.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/20.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//


//生产环境
//#define GeneralUrl(relativeUrl) [NSString stringWithFormat:@"http://115.29.214.90:8080%@&v=%ld", relativeUrl,version]
#define GeneralUrl(relativeUrl) [NSString stringWithFormat:@"http://115.29.214.90:8080%@", relativeUrl]

//登录
#define SCUrl_Login GeneralUrl(@"/keleapp/security/login.jspx")

//获取验证码(注册和找回密码时获取验证码)
#define SCUrl_GetVerificationCode GeneralUrl(@"/keleapp/security/getVerCode.jspx")

//验证(验证验证码，验证码超时判断)
#define SCUrl_VerificationCodeTimeoutJudgment GeneralUrl(@"/keleapp/security/verifyVerCode.jspx")

//注册
#define SCUrl_Registered GeneralUrl(@"/keleapp/security/appRegister.jspx")

//找回密码
#define SCUrl_RetrieveThePassword GeneralUrl(@"/keleapp/security/changePwd.jspx")

//我的优惠券
#define SCUrl_MyDiscountCoupon GeneralUrl(@"/keleapp/coupon/couponList.jspx")

//我的车库列表
#define SCUrl_MyGarage GeneralUrl(@"/keleapp/car/carList.jspx")

//我的车库编辑
#define SCUrl_GarageEditor GeneralUrl(@"/keleapp/car/carEdit.jspx")

//我的车库删除
#define SCUrl_GarageDeleted GeneralUrl(@"/keleapp/car/carDelete.jspx")

//我的车库-设为默认车辆
#define SCUrl_MyGarageSetAsTheDefaultCar GeneralUrl(@"/keleapp/car/carDefault.jspx")

//我的车库-添加车辆
#define SCUrl_MyGarageAddACar GeneralUrl(@"/keleapp/car/carAdd.jspx")

//领券优惠券列表
#define SCUrl_GetCouponsList GeneralUrl(@"/keleapp/coupon/couponReceiveList.jspx")

//领取优惠券-领取
#define SCUrl_ReceiveCouponsGet GeneralUrl(@"/keleapp/coupon/couponReceive.jspx")

//我的 编辑个人信息
#define SCUrl_EditUserInfo GeneralUrl(@"/keleapp/userInfor/editUser.jspx")
