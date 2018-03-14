//
//  SCSharedCarSuitsClient.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/9.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface SCSharedCarSuitsClient : NSObject
+ (instancetype)shareInstance;
- (id)post:(NSString *)URLString
parameters:(NSDictionary *)parameters
   success:(SuccessBlock)success
    notice:(OptionBlock)notice
   failure:(FailureBlock)failure;

- (id)get:(NSString *)URLString
parameters:(NSDictionary *)parameters
  success:(SuccessBlock)success
  failure:(FailureBlock)failure;

- (id)request:(NSString *)URLString
    parameters:(NSDictionary *)parameters
constructingBodyWithBlock:(NetworkRequestFormDataBlock)block
       success:(SuccessBlock)success
       failure:(FailureBlock)failure;
@end
