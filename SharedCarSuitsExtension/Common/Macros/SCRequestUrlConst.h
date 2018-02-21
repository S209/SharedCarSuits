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



