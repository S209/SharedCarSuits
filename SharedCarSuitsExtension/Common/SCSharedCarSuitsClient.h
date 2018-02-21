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

@end
