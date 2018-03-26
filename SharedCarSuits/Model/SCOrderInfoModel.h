//
//  SCOrderInfoModel.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/25.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 appointTime = "2018-03-25 23:11:20";
 createTime = "2018-03-25 23:06:52";
 orderId = 425;
 orderNo = "5-1521990412861-425";
 restTime = 30;
 */
@class SCOrderListModel;
@interface SCOrderInfoModel : NSObject
@property (nonatomic, copy) NSString * appointTime;
@property (nonatomic, copy) NSString * createTime;
@property (nonatomic, copy) NSString * orderId;
@property (nonatomic, copy) NSString * orderNo;
@property (nonatomic, assign) NSInteger restTime;
@property (nonatomic, strong) SCOrderListModel * listModel;
@end
