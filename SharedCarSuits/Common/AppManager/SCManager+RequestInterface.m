//
//  SCManager+RequestInterface.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/20.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCManager+RequestInterface.h"
#import "SCSharedCarSuitsClient.h"
#import "SCLoginResponseObjectModel.h"
#import "SCManager+MBProgressHUD.h"
#import "SCManager+CommonMethods.h"
@implementation SCManager (RequestInterface)
- (void)getRegisteredVerificationCodeWithPhoneNumber:(NSString *)phoneNumber success:(SuccessBlock)success
                                              notice:(OptionBlock)notice
                                             failure:(FailureBlock)failure
{
    
    [self requestUrl:SCUrl_GetVerificationCode andParamater:@{@"phoneNum":phoneNumber} success:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (success) {
            success(serializer,responseObject);
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (notice) {
            notice(serializer,responseObject);
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        if (failure) {
            failure(serializer,error);
        }
    }];
}

- (void)logInWithLoginName:(NSString *)loginName passWord:(NSString *)passWord success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure
{
    NSDictionary * parameterDictionary = @{@"loginName":loginName,@"passWord":passWord};
    [self requestUrl:SCUrl_Login andParamater:parameterDictionary success:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (success) {
            [[NSUserDefaults standardUserDefaults] setObject:responseObject forKey:SCLoginModelUserDict];
            [[NSUserDefaults standardUserDefaults] synchronize];
            success(serializer,responseObject);
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (notice) {
            notice(serializer,responseObject);
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        if (failure) {
            failure(serializer,error);
        }
    }];
}

- (void)verificationWithPhoneNum:(NSString *)phoneNum code:(NSString *)code success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure
{
    NSDictionary * parameterDictionary = @{@"phoneNum":phoneNum,@"code":code};
    [self requestUrl:SCUrl_VerificationCodeTimeoutJudgment andParamater:parameterDictionary success:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (success) {
            success(serializer,responseObject);
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (notice) {
            notice(serializer,responseObject);
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        if (failure) {
            failure(serializer,error);
        }
    }];
}

- (void)retrieveThePasswordWithloginName:(NSString *)loginName passWord:(NSString *)passWord success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure
{
    NSDictionary * parameterDictionary = @{@"loginName":loginName,@"passWord":passWord};
    [self requestUrl:SCUrl_RetrieveThePassword andParamater:parameterDictionary success:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (success) {
            success(serializer,responseObject);
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (notice) {
            notice(serializer,responseObject);
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        if (failure) {
            failure(serializer,error);
        }
    }];
}


- (void)myCouponListWithId:(NSString *)userId andLength:(NSString *)length success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure
{
    NSDictionary * paramater = @{@"id":userId,@"length":length};
    [self requestUrl:SCUrl_MyDiscountCoupon andParamater:paramater success:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (success) {
            success(serializer,responseObject);
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (notice) {
            notice(serializer,responseObject);
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        if (failure) {
            failure(serializer,error);
        }
    }];
}

- (void)myGarageWithId:(NSString *)userId andLength:(NSString *)length success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;
{
    NSDictionary * paramater = @{@"id":userId,@"length":length};
    [self requestUrl:SCUrl_MyGarage andParamater:paramater success:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (success) {
            success(serializer,responseObject);
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (notice) {
            notice(serializer,responseObject);
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        if (failure) {
            failure(serializer,error);
        }
    }];
}




- (void)editUserInfoWithRealName:(NSString *)realNameString HeadUrl:(NSData *)headUrlData success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure
{
    NSDictionary * paramaterDict = @{@"realName":realNameString,@"headUrl":headUrlData};
    [self requestUrl:SCUrl_EditUserInfo andParamater:paramaterDict success:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (success) {
            success(serializer,responseObject);
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (notice) {
            notice(serializer,responseObject);
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        if (failure) {
            failure(serializer,error);
        }
    }];
}

//SCUrl_Registered
- (void)registeredWithPhoneNum:(NSString *)phoneNum passWord:(NSString *)passWord
                      carModel:(NSString *)carModel carNum:(NSString *)carNum success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure;
{
    
    if (!phoneNum) {
        phoneNum = @"";
    }
    if (!passWord) {
        passWord = @"";
    }
    if (!carNum) {
        carNum = @"";
    }
    if (!carModel) {
        carModel = @"";
    }
    
    NSDictionary * paramater = @{@"phoneNum":phoneNum,@"passWord":passWord,@"carModel":carModel,@"carNum":carNum};
    [self requestUrl:SCUrl_Registered andParamater:paramater success:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (success) {
            success(serializer,responseObject);
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (notice) {
            notice(serializer,responseObject);
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        if (failure) {
            failure(serializer, error);
        }
    }];
}

- (void)myGarageEditWithCarId:(NSString *)carId carModel:(NSString *)carModel carNum:(NSString *)carNum success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure
{
    NSDictionary * paramater = @{@"carId":carId,@"carModel":carModel,@"carNum":carNum};
    [self requestUrl:SCUrl_GarageEditor andParamater:paramater success:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (success) {
            success(serializer,responseObject);
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (notice) {
            notice(serializer,responseObject);
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        if (failure) {
            failure(serializer, error);
        }
    }];
}

- (void)myGarageDeleteWithUserId:(NSString *)userId success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure
{
    NSDictionary * paramater = @{@"id":userId};
    [self requestUrl:SCUrl_GarageDeleted andParamater:paramater success:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (success) {
            success(serializer,responseObject);
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (notice) {
            notice(serializer,responseObject);
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        if (failure) {
            failure(serializer, error);
        }
    }];
}

- (void)myGarageCarDefaultWithUserId:(NSString *)userId success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure
{
    NSDictionary * paramater = @{@"id":userId};
    [self requestUrl:SCUrl_MyGarageSetAsTheDefaultCar andParamater:paramater success:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (success) {
            success(serializer,responseObject);
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (notice) {
            notice(serializer,responseObject);
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        if (failure) {
            failure(serializer, error);
        }
    }];
}

- (void)myGarageCarAddWithCarNum:(NSString *)carNum carModel:(NSString *)carModel success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure
{
    NSDictionary * paramater = @{@"carModel":carModel,@"carNum":carNum};
    [self requestUrl:SCUrl_MyGarageAddACar andParamater:paramater success:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (success) {
            success(serializer,responseObject);
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (notice) {
            notice(serializer,responseObject);
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        if (failure) {
            failure(serializer, error);
        }
    }];
}

- (void)couponReceiveListWithUserId:(NSString *)userId length:(NSString *)length success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure
{
    NSDictionary * paramater = @{@"id":userId,@"length":length};
    [self requestUrl:SCUrl_GetCouponsList andParamater:paramater success:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (success) {
            success(serializer,responseObject);
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (notice) {
            notice(serializer,responseObject);
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        if (failure) {
            failure(serializer, error);
        }
    }];
}

- (void)couponReceiveWithUserId:(NSString *)userId success:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure
{
    NSDictionary * paramater = @{@"id":userId};
    [self requestUrl:SCUrl_ReceiveCouponsGet andParamater:paramater success:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (success) {
            success(serializer,responseObject);
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (notice) {
            notice(serializer,responseObject);
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        if (failure) {
            failure(serializer, error);
        }
    }];
}

- (void)requestUrl:(NSString *)url andParamater:(NSDictionary *)parameter success:(SuccessBlock)success
            notice:(OptionBlock)notice
           failure:(FailureBlock)failure
{
    [[SCSharedCarSuitsClient shareInstance] post:url parameters:parameter success:^(NSURLSessionDataTask *serializer, id responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] integerValue];
        if (code == 200) {
            if (success) {
               NSDictionary * dataDict = [responseObject objectForKey:@"data"];
                if ([NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"]].length>0) {
                    [SCManager dismissInfo:[responseObject objectForKey:@"message"]];
                }
                
                if ([dataDict isKindOfClass:[NSDictionary class]] && dataDict.allKeys.count) {
                    NSString * uIdString = [NSString stringWithFormat:@"%zd",[responseObject objectForKey:@"uId"]];
                    
                    [[SCManager shareInstance] setUserUid:uIdString];
                    NSString * sessionIdString = [NSString stringWithFormat:@"%zd",[responseObject objectForKey:@"sessionId"]];
                    [[SCManager shareInstance] setSessionId:sessionIdString];
                    
                    success(serializer,dataDict);
                }else{
                    success(serializer,responseObject);
                }
            }
        }else{
            NSString * msg = [responseObject objectForKey:@"message"];
            if (msg.length > 0) {
                [SCManager dismissInfo:msg];
            }
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        if (notice) {
            notice(serializer,responseObject);
        }
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        if (failure) {
            failure(serializer,error);
        }
    }];
}
@end
