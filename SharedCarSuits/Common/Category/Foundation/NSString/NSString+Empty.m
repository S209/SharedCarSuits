//
//  NSString+Empty.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/25.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "NSString+Empty.h"

@implementation NSString (Empty)
- (NSString *)isEmpty
{
    if (self.length == 0) {
        return @" ";
    }
    return self;
}
@end
