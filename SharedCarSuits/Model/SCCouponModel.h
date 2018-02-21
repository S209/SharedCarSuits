//
//  SCCouponModel.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/21.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCCouponModel : NSObject
@property (nonatomic, copy) NSString * createTime;
@property (nonatomic, assign) NSInteger price;
@property (nonatomic, assign) NSInteger isUsed;
@property (nonatomic, assign) NSInteger orderType;
@property (nonatomic, assign) NSInteger cpuponId;
@property (nonatomic, copy) NSString * descriptionString;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * number;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, copy) NSString * endTime;
@end
