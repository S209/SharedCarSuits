//
//  SCUserModel.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/25.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCUserModel.h"
#import "SCMyGarageListPageModel.h"
@implementation SCUserModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"cars" : [SCMyGarageListPageModel class]};
}
@end
