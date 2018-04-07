//
//  SCOrderListModel.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/15.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCOrderListModel : NSObject
@property (nonatomic, copy) NSString * appointTime;
@property (nonatomic, copy) NSString * createTime;
@property (nonatomic, copy) NSString * orderNo;
@property (nonatomic, copy) NSString * price;
@property (nonatomic, copy) NSString * cancelTime;
@property (nonatomic, assign) NSInteger orderType;//1：洗车美容 //2：换油保养 //3：钣金喷漆
@property (nonatomic, copy) NSString * carNum;
@property (nonatomic, copy) NSString * shopName;
@property (nonatomic, copy) NSString * finishTime;
@property (nonatomic, assign) NSInteger restTime;
@property (nonatomic, copy) NSString * orderProjectName;
@property (nonatomic, copy) NSString * payTime;
@property (nonatomic, copy) NSString * orderId;
@end
