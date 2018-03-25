//
//  SCAppointmentModel.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/25.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCAppointmentModel : NSObject
@property (nonatomic, assign) NSInteger ifAppointment;//0：不可以 1：可以
@property (nonatomic, copy) NSString * time;
@end
