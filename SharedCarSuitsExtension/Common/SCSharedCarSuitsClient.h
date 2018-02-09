//
//  SCSharedCarSuitsClient.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/9.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void (^SuccessBlock)(NSURLSessionDataTask *serializer, id responseObject);
typedef void (^OptionBlock)(NSURLSessionDataTask *serializer, id responseObject);
typedef void (^FailureBlock)(NSURLSessionDataTask *serializer, NSError *error);

@interface SCSharedCarSuitsClient : NSObject
+ (instancetype)shareInstance;
- (id)post:(NSString *)URLString
parameters:(NSDictionary *)parameters
   success:(SuccessBlock)success
    notice:(OptionBlock)notice
   failure:(FailureBlock)failure;

@end
