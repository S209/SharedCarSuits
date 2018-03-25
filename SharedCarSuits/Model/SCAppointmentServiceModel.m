//
//  SCAppointmentServiceModel.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/25.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCAppointmentServiceModel.h"

@implementation SCAppointmentServiceModel
+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{@"descriptionString":@"description",@"idDes":@"id"};
}
@end
