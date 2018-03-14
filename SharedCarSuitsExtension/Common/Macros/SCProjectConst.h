//
//  SCProjectConst.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/10.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#ifndef SCProjectConst_h
#define SCProjectConst_h
#import <AFNetworking.h>

typedef void (^SuccessBlock)(NSURLSessionDataTask *serializer, id responseObject);
typedef void (^OptionBlock)(NSURLSessionDataTask *serializer, id responseObject);
typedef void (^FailureBlock)(NSURLSessionDataTask *serializer, NSError *error);
typedef void (^NetworkRequestFormDataBlock)(id<AFMultipartFormData> formData);
typedef enum {
    WPPasswordStrengthTypeWeak = 1,
    WPPasswordStrengthTypeModerate = 2,
    WPPasswordStrengthTypeStrong = 3,
} WPPasswordStrengthType;
#define WEAKSELF __weak typeof(self) weakSelf = self;
#define STRONGSELF __strong typeof(weakSelf) strongSelf = weakSelf;
#endif /* SCProjectConst_h */
