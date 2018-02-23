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
#import "SCManager+CommonMethods.h"
#import <AFNetworkReachabilityManager.h>
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

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.httpsRequestManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:[WPCommonDefine sharedInstance].requestDomain]];
        self.httpsRequestManager = [[AFHTTPSessionManager alloc] init];
        self.httpsRequestManager.requestSerializer = [AFJSONRequestSerializer serializer];
        
         [self.httpsRequestManager.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"userToken" ]forHTTPHeaderField:@"token"];
        
        
        self.httpsRequestManager.responseSerializer = [AFJSONResponseSerializer serializer];
       [self.httpsRequestManager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil]];
//        [self.httpsRequestManager.requestSerializer setTimeoutInterval:kAPITimeOut];
    }
    return self;
}

- (id)post:(NSString *)URLString
parameters:(NSDictionary *)parameters
   success:(SuccessBlock)success
    notice:(OptionBlock)notice
   failure:(FailureBlock)failure{
    AFHTTPSessionManager *requestManager = self.httpsRequestManager;

    return [requestManager POST:URLString parameters:[self finalParametersWithParams:parameters] progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task,error);
        }
    }];
}

#pragma mark 处理添加请求参数
- (NSDictionary *)finalParametersWithParams:(NSDictionary *)params
{
    NSMutableDictionary * mutableParams = [NSMutableDictionary dictionary];
    [mutableParams setValue:params forKey:@"params"];
    NSString *string = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [mutableParams setValue:@"" forKey:@"token"];
    [mutableParams setValue:string forKey:@"version"];
    [mutableParams setValue:@"IOS" forKey:@"appType"];
    [mutableParams setValue:[NSString stringWithFormat:@"%ld",(long)[[NSDate date] timeIntervalSince1970]] forKey:@"ts"];
    NSString * deviceName = [[SCManager shareInstance]iphoneType];
    [mutableParams setValue:deviceName forKey:@"deviceName"];
    NSString * deviceTokenString;
    
#warning 真机测试
    if ([SCManager readUUID].length > 0) {
        deviceTokenString = [SCManager readUUID];
    }else{
         NSString * deviceUUID = [[UIDevice currentDevice].identifierForVendor UUIDString];
        [SCManager saveUUID:deviceUUID];
        deviceTokenString = deviceUUID;
    }
    [mutableParams setValue:deviceTokenString forKey:@"deviceToken"];
    [mutableParams setValue:@"" forKey:@"session"];
    [mutableParams setObject:@"" forKey:@"uId"];
    NSInteger status = [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
    [mutableParams setValue:[NSString stringWithFormat:@"%zd",status] forKey:@"netType"];
    NSString * locationString = [[SCManager shareInstance] getPosition];
    [mutableParams setValue:locationString forKey:@"location"];
    return mutableParams;
}

@end
