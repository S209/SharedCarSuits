//
//  SCManager.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/12.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCManager.h"

@implementation SCManager
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    static SCManager * instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[SCManager alloc] init];
    });
    return instance;
}
@end
