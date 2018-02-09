//
//  SCSharedCarSuitsClient.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/9.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCSharedCarSuitsClient.h"
#import <AFNetworking.h>
#import <Foundation/Foundation.h>

@interface SCSharedCarSuitsClient()
@property (nonatomic, strong) AFHTTPSessionManager *httpsRequestManager;
@end

@implementation SCSharedCarSuitsClient
+ (instancetype)shareInstance
{
    static SCSharedCarSuitsClient * shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[SCSharedCarSuitsClient alloc] init];
    });
    return shareInstance;
}

- (id)post:(NSString *)URLString
parameters:(NSDictionary *)parameters
   success:(SuccessBlock)success
    notice:(OptionBlock)notice
   failure:(FailureBlock)failure{
    AFHTTPSessionManager *requestManager = self.httpsRequestManager;
    [requestManager.requestSerializer setValue:@""
                            forHTTPHeaderField:@"token"];
    
    
    return [requestManager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

#pragma mark 处理添加请求参数
- (NSDictionary *)finalParametersWithParams:(NSDictionary *)params
{
    return params;
}

@end
