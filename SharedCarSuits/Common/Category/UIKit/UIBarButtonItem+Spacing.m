//
//  UIBarButtonItem+Spacing.m
//  SoYoungMobile40
//
//  Created by You Tu on 15/6/8.
//  Copyright (c) 2015年 soyoung. All rights reserved.
//

#import "UIBarButtonItem+Spacing.h"

@implementation UIBarButtonItem (Spacing)
+ (UIBarButtonItem *)sy_spacer:(CGFloat)spacer {
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    space.width = spacer;
    return space;
}
+ (UIBarButtonItem *)sy_leftSpacer7
{
    return [self sy_spacer:-18];
//    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    space.width = -18;
//    return space;
}

+ (UIBarButtonItem *)sy_rightSpacer7
{
    return [self sy_spacer:-2];
//    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    space.width = -2;
//    return space;
}

+ (UIBarButtonItem *)sy_rightSpacer35
{
    return [self sy_spacer:20];
//    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    space.width = 20;
//    return space;
}

+ (UIBarButtonItem *)sy_rightSpacer10
{
    return [self sy_spacer:18];
//    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    space.width = 18;
//    return space;
}

//+ (void)sy_setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem
//{
//    if (leftBarButtonItem) {
//        [self setLeftBarButtonItems:@[[self sy_leftSpacer7],leftBarButtonItem]];
//    } else {
//        [self setLeftBarButtonItem:leftBarButtonItem];
//    }
//}
//
//+ (void)sy_setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem
//{
//    if (rightBarButtonItem) {
//        [self setRightBarButtonItems:@[[self sy_rightSpacer7],rightBarButtonItem]];
//    } else {
//        [self setRightBarButtonItem:rightBarButtonItem];
//    }
//}

@end
