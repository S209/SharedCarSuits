//
//  SCNetworkMultiDataObj.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/14.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCNetworkMultiDataObj.h"

@implementation SCNetworkMultiDataObj
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fileName = @"file.jpg";
        self.mimeType = @"image/jpg";
    }
    return self;
}

@end
