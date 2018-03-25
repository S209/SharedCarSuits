//
//  SCMyAppointmentViewController.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/23.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCBaseViewController.h"
typedef NS_ENUM(NSInteger, ServiceType){
    ServiceTypeCarBeauty = 1,
    ServiceTypeOilChangeMaintenance = 2,
};
@interface SCMyAppointmentViewController : SCBaseViewController
@property (nonatomic, assign) ServiceType serviceType;
@end
