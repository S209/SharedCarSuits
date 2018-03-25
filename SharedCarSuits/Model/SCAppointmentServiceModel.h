//
//  SCAppointmentServiceModel.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/25.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCAppointmentServiceModel : NSObject
@property (nonatomic, copy) NSString * descriptionString;
@property (nonatomic, assign) NSInteger idDes;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * price;
@property (nonatomic, assign) NSInteger taskTime;
@property (nonatomic, copy) NSString * url;
@end
