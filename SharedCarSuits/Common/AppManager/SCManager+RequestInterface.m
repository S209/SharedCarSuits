//
//  SCManager+RequestInterface.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/20.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCManager+RequestInterface.h"
#import "SCSharedCarSuitsClient.h"
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
    [self requestUrl:SCUrl_Login andParamater:parameterDictionary success:^(NSURLSessionDataTask *serializer, id responseObject) {
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


- (void)myGarageWithSuccess:(SuccessBlock)success notice:(OptionBlock)notice failure:(FailureBlock)failure
{
    [self requestUrl:SCUrl_MyGarage andParamater:@{} success:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        
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
                success(serializer,responseObject);
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
