//
//  NSMutableArray+Category.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/6.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "NSMutableArray+Category.h"

@implementation NSMutableArray (Category)
#pragma mark - Add
- (void)safeAddObject:(id)obj
{
    if (obj) {
        [self addObject:obj];
    }
}
- (void)safeAddObjectsFromArray:(NSArray *)otherArray
{
    if (otherArray.count) {
        [self addObjectsFromArray:otherArray];
    }
}

#pragma mark - Insert
- (void)safeInsertObject:(id)obj atIndex:(NSUInteger)index
{
    if (index <= self.count && obj) {
        [self insertObject:obj atIndex:index];
    }
}

- (void)safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes
{
    if (objects.count && indexes) {
        [self insertObjects:objects atIndexes:indexes];
    }
}

#pragma mark - Remove
- (void)safeRemoveObject:(id)anObject
{
    if (anObject && [self containsObject:anObject]) {
        [self removeObject:anObject];
    }
}

- (void)safeRemoveLastObject
{
    if (self.count) {
        [self removeLastObject];
    }
}

- (void)safeRemoveObject:(id)anObject inRange:(NSRange)aRange
{
    if (anObject && aRange.location + aRange.length < self.count) {
           [self removeObject:anObject inRange:aRange];
    }
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        [self removeObjectAtIndex:index];
    }
}

- (void)safeRemoveObjectIdenticalTo:(id)anObject inRange:(NSRange)aRange
{
    if (anObject && aRange.location + aRange.length < self.count) {
        [self removeObjectIdenticalTo:anObject inRange:aRange];
    }
}

- (void)safeRemoveObjectsAtIndexex:(NSIndexSet *)indexes
{
    if (indexes) {
        [self removeObjectsAtIndexes:indexes];
    }
}

#pragma mark - Replace
- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (anObject && index < self.count) {
        [self replaceObjectAtIndex:index withObject:anObject];
    }
}

- (void)safeReplaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects
{
    if (objects.count && indexes) {
        [self replaceObjectsAtIndexes:indexes withObjects:objects];
    }
}
@end
