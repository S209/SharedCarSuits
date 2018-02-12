//
//  SCManager+CommonMethods.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/12.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCManager+CommonMethods.h"

@implementation SCManager (CommonMethods)

- (void)bezierPathLeftTopAndRightTopWithView:(UIView *)view
{
    dispatch_async(dispatch_get_main_queue(), ^{
        // 处理耗时操作的代码块...
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:view.bounds.size];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = view.bounds;
        maskLayer.path = maskPath.CGPath;
        view.layer.mask = maskLayer;
    });
}

- (void)bezierPathLeftTopAndRightTopWithView:(UIView *)view withRadius:(CGFloat)radius
{
    dispatch_async(dispatch_get_main_queue(), ^{
        // 处理耗时操作的代码块...
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = view.bounds;
        maskLayer.path = maskPath.CGPath;
        view.layer.mask = maskLayer;
    });
    
}
@end
