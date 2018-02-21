//
//  SCMyGarageListPageModel.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/21.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCMyGarageListPageModel : NSObject
@property (nonatomic, assign) NSInteger carId;
@property (nonatomic, copy) NSString * carModel;
@property (nonatomic, assign) NSInteger type;//0：默认车辆  1：非默认
@property (nonatomic, copy) NSString * carNum;
@end
