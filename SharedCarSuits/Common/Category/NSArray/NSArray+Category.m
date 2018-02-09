//
//  NSArray+Category.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/6.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "NSArray+Category.h"

@implementation NSArray (Category)
- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    return nil;
}
@end
