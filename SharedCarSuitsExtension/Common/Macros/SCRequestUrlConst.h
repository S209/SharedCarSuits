//
//  SCRequestUrlConst.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/20.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//


//生产环境
//#define GeneralUrl(relativeUrl) [NSString stringWithFormat:@"http://115.29.214.90:8080%@&v=%ld", relativeUrl,version]
#define GeneralUrl(relativeUrl) [NSString stringWithFormat:@"http://dzcflm.com%@", relativeUrl]

//登录(完)
#define SCUrl_Login GeneralUrl(@"/security/login.jspx")

//获取验证码(注册和找回密码时获取验证码)(完)
#define SCUrl_GetVerificationCode GeneralUrl(@"/security/getVerCode.jspx")

//验证(验证验证码，验证码超时判断)(完)
#define SCUrl_VerificationCodeTimeoutJudgment GeneralUrl(@"/security/verifyVerCode.jspx")

//注册(完)
#define SCUrl_Registered GeneralUrl(@"/security/appRegister.jspx")

//找回密码(完)
#define SCUrl_RetrieveThePassword GeneralUrl(@"/security/changePwd.jspx")

//我的优惠券(完)
#define SCUrl_MyDiscountCoupon GeneralUrl(@"/coupon/couponList.jspx")

//我的车库列表(完)
#define SCUrl_MyGarage GeneralUrl(@"/car/carList.jspx")

//我的车库编辑(完)
#define SCUrl_GarageEditor GeneralUrl(@"/car/carEdit.jspx")

//我的车库删除(完)
#define SCUrl_GarageDeleted GeneralUrl(@"/car/carDelete.jspx")

//我的车库-设为默认车辆(完)
#define SCUrl_MyGarageSetAsTheDefaultCar GeneralUrl(@"/car/carDefault.jspx")

//我的车库-添加车辆(完)
#define SCUrl_MyGarageAddACar GeneralUrl(@"/car/carAdd.jspx")

//领券优惠券列表(完)
#define SCUrl_GetCouponsList GeneralUrl(@"/coupon/couponReceiveList.jspx")

//领取优惠券-领取(完)
#define SCUrl_ReceiveCouponsGet GeneralUrl(@"/coupon/couponReceive.jspx")

//轮播广告(完)
#define SCUrl_BannerList GeneralUrl(@"/banner/bannerList.jspx")

//我的汽车列表 (完)
#define SCUrl_allCarBrand GeneralUrl(@"/upload/data/allCarBrand.json")

//我的门店列表(差导航)
#define SCUrl_ShopList GeneralUrl(@"/shop/shopList.jspx")

//门店 设置默认门店(完)
#define SCUrl_ShopDefault GeneralUrl(@"/shop/shopDefault.jspx")

//我的订单-列表+详细页(完)
#define SCUrl_OrderList GeneralUrl(@"/order/orderList.jspx")

//5.2  我的订单-取消订单(完)
#define SCUrl_CancelOrder GeneralUrl(@"/coupon/cancelOrder.jspx")


//5.4  有效优惠券
#define SCUrl_OrderCoupon GeneralUrl(@"/coupon/orderCoupon.jspx")

//我的 编辑个人信息(完)
#define SCUrl_EditUserInfo GeneralUrl(@"/userInfor/editUser.jspx")

//userInfor/editUserPhoto.jspx(完)
#define SCUrl_editUserPhoto GeneralUrl(@"keleapp/userInfor/editUserPhoto.jspx")


//订单 预约订单-今日时间+服务项目(完)
#define SCUrl_AppointmentOrder GeneralUrl(@"/order/appointmentOrder.jspx")

//订单 预约订单-今日/明日时间列表(完)
#define SCUrl_AppointmentOrderTime GeneralUrl(@"/order/appointmentOrderTime.jspx")

//预约订单-我要预约(完)
#define SCUrl_CreateOrder GeneralUrl(@"/order/createOrder.jspx")

//5.3  立即下单
#define SCUrl_PayOrder GeneralUrl(@"/orderpay/payOrder.jspx")



