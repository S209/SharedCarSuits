//
//  UIViewController+Utility.m
//  SoYoungMobile40
//
//  Created by jinzhanxie on 15/6/10.
//  Copyright (c) 2015年 soyoung. All rights reserved.
//

#import "UIViewController+Utility.h"
#import "UIButton+Navigation.h"
#import "UIBarButtonItem+Spacing.h"


@implementation UIViewController (Utility)
#pragma mark - 常用
/** 左边和右边全部的item(目前方法在透明的navigationBar的页面中用到) */
- (NSArray *)sy_leftRightAllItems {
    NSMutableArray * itemList = [NSMutableArray array];
    [itemList addObjectsFromArray:self.navigationItem.leftBarButtonItems];
    [itemList addObjectsFromArray:self.navigationItem.rightBarButtonItems];
    return itemList;
}

- (void)sy_rightItemsWithRightBarButtonItems:(NSArray *)itemsArray{
    self.navigationItem.rightBarButtonItems = itemsArray;
}

- (void)sy_leftBarButtonItem
{
    UIBarButtonItem * item = [self backItemWithAction:@selector(sy_goBack:)];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)sy_rightBarDeleteItemWithDelete
{
    return [self sy_setRightItemWithImage:[UIImage imageNamed:@"title_btn_close_black"] action:@selector(sy_goBack:)];
}

- (UIBarButtonItem *)backItemWithAction:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"title_btn_back"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"title_btn_back"] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(0, 0, 21, 44);
    if (action != nil) {
        [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    UIBarButtonItem *leftBarbuttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    return leftBarbuttonItem;
}

- (void)sy_goBack:(id)sender
{
   
    [self.navigationController popViewControllerAnimated:YES];
    
    if (self.title && self.title.length) {
        self.title = @"";
    }
}
- (void)sy_dismissView:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


- (void)sy_setDefaultCloseBarButtonItem {
    //[self sy_cleanLeftItem];
    [self sy_setLeftItem:[self backItemWithAction:@selector(sy_dismissView:)].customView];//.navigationItem setLeftBarButtonItem:[self backItemWithAction:@selector(sy_dismissView:)]];
}


/**
 * 清除左边的item
 */
- (void)sy_cleanLeftItem {
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.leftBarButtonItems = nil;
}
/**
 * 清除右边的item
 */
- (void)sy_cleanRightItem {
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.rightBarButtonItems = nil;
}

#pragma mark - 创建(左)
- (void)sy_setLeftItemWithTitle:(NSString *)title
                         action:(SEL)selector
                         margin:(CGFloat)margin {
    UIButton *btn = [UIButton sy_navLeftButtonWithTitle:title];
    [btn addTarget:self
            action:selector
  forControlEvents:UIControlEventTouchUpInside];
    [self sy_setLeftItem:btn
                  margin:margin];
}

- (void)sy_setLeftItemWithTitle:(NSString *)title
                         action:(SEL)selector {
    [self sy_setLeftItemWithTitle:title
                           action:selector
                           margin:kSY_DEFAULT_LEFT_MARGIN];
}

- (void)sy_setLeftItemWithImage:(UIImage *)image
                         action:(SEL)selector
                         margin:(CGFloat)margin {
    UIButton *btn = [UIButton sy_navLeftButtonWithImage:image];
    [btn addTarget:self
            action:selector
  forControlEvents:UIControlEventTouchUpInside];
    [self sy_setLeftItem:btn
                  margin:margin];
}

- (void)sy_setLeftItemWithImage:(UIImage *)image
                         action:(SEL)selector {
    [self sy_setLeftItemWithImage:image
                           action:selector
                           margin:kSY_DEFAULT_LEFT_MARGIN];
}

- (void)sy_setLeftItem:(UIView *)view {
    [self sy_setLeftItem:view
                  margin:kSY_DEFAULT_LEFT_MARGIN];
}

- (void)sy_setLeftItem:(UIView *)view
                margin:(CGFloat)margin
{
    if (view == nil) {
        [self sy_cleanLeftItem];
        return;
    }
    [self sy_setLeftItems:@[view]
                   margin:margin
                  spacing:kSY_DEFAULT_LEFT_SPACING];
}

- (void)sy_setLeftItems:(NSArray *)itemsArray {
    [self sy_setLeftItems:itemsArray
                   margin:kSY_DEFAULT_LEFT_MARGIN
                  spacing:kSY_DEFAULT_LEFT_SPACING];
}

- (void)sy_setLeftItems:(NSArray *)itemsArray
                 margin:(CGFloat)margin
                spacing:(CGFloat)spacing {
    [self sy_cleanLeftItem];
    if (itemsArray == nil
        || itemsArray.count == 0) {
        return;
    }
    NSMutableArray *buttonArray = [NSMutableArray array];
    for (NSInteger i = 0; i < itemsArray.count; i++)
    {
        UIView * view = itemsArray[i];
        if ([view isKindOfClass:[UIView class]] == NO) {
            continue;
        }
        [view removeFromSuperview];
        UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:view];
        if (i == 0) {
            //边距
            [buttonArray addObject:[UIBarButtonItem sy_spacer:margin]];
        } else {
            //间距
            [buttonArray addObject:[UIBarButtonItem sy_spacer:spacing]];
        }
        [buttonArray addObject:right];
    }
    [self.navigationItem setLeftBarButtonItems:buttonArray];
}

#pragma mark - 创建(右)

- (void)sy_setRightItemWithTitle:(NSString *)title
                      titleColor:(UIColor *)titleColor
                       titleFont:(UIFont *)titleFont
                          action:(SEL)selector
                          margin:(CGFloat)margin{
    UIButton * btn = [UIButton sy_navRightButtonWithTitle:title titleFont:titleFont titleColor:titleColor];
    [btn addTarget:self
            action:selector
  forControlEvents:UIControlEventTouchUpInside];
    [self sy_setRightItem:btn
                   margin:margin];
}



- (void)sy_setRightItemWithTitle:(NSString *)title
                          action:(SEL)selector
                       titleFont:(UIFont *)font
                      titleColor:(UIColor *)titleColor
                          margin:(CGFloat)margin {
    UIButton *btn = [UIButton sy_navRightButtonWithTitle:title];
    [btn addTarget:self
            action:selector
  forControlEvents:UIControlEventTouchUpInside];
    [self sy_setRightItem:btn
                   margin:margin];
}

- (void)sy_setRightItemWithTitle:(NSString *)title
                          action:(SEL)selector
                          margin:(CGFloat)margin {
    UIButton *btn = [UIButton sy_navRightButtonWithTitle:title];
    [btn addTarget:self
            action:selector
  forControlEvents:UIControlEventTouchUpInside];
    [self sy_setRightItem:btn
                   margin:margin];
}

- (void)sy_setRightItemWithTitle:(NSString *)title
                          action:(SEL)selector {
    [self sy_setRightItemWithTitle:title
                            action:selector
                            margin:kSY_DEFAULT_RIGHT_MARGIN];
}

- (void)sy_setRightItemWithTitle:(NSString *)title
                       titleFont:(UIFont *)font
                      titleColor:(UIColor *)titleColor
                          action:(SEL)selector{
    [self sy_setRightItemWithTitle:title titleColor:titleColor titleFont:font action:selector margin:kSY_DEFAULT_RIGHT_MARGIN];
    
}

- (void)sy_setRightItemWithImage:(UIImage *)image
                          action:(SEL)selector
                          margin:(CGFloat)margin {
    UIButton *btn = [UIButton sy_navRightButtonWithImage:image];
    [btn addTarget:self
            action:selector
  forControlEvents:UIControlEventTouchUpInside];
    [self sy_setRightItem:btn
                   margin:margin];
}

- (void)sy_setRightItemWithImage:(UIImage *)image
                          action:(SEL)selector {
    [self sy_setRightItemWithImage:image
                            action:selector
                            margin:kSY_DEFAULT_RIGHT_MARGIN];
}

- (void)sy_setRightItem:(UIView *)view {
    [self sy_setRightItem:view
                   margin:kSY_DEFAULT_RIGHT_MARGIN];
}

- (void)sy_setRightItem:(UIView *)view
                 margin:(CGFloat)margin {
    if (view == nil) {
        [self sy_cleanRightItem];
        return;
    }
    [self sy_setRightItems:@[view]
                    margin:margin
                   spacing:kSY_DEFAULT_RIGHT_SPACING];
}

- (void)sy_setRightItems:(NSArray *)itemsArray {
    [self sy_setRightItems:itemsArray
                    margin:kSY_DEFAULT_RIGHT_MARGIN
                   spacing:kSY_DEFAULT_RIGHT_SPACING];
}

- (void)sy_setRightItems:(NSArray *)itemsArray
                  margin:(CGFloat)margin
                 spacing:(CGFloat)spacing {
    [self sy_cleanRightItem];
    if (itemsArray == nil
        || itemsArray.count == 0) {
        return;
    }
    NSMutableArray *buttonArray = [NSMutableArray array];
    for (NSInteger i = 0; i < itemsArray.count; i++)
    {
        UIView * view = itemsArray[i];
        if ([view isKindOfClass:[UIView class]] == NO) {
            continue;
        }
        [view removeFromSuperview];
        UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:view];
        if (i == 0) {
            //边距
            [buttonArray addObject:[UIBarButtonItem sy_spacer:margin]];
        } else {
            //间距
            [buttonArray addObject:[UIBarButtonItem sy_spacer:spacing]];
        }
        [buttonArray addObject:right];
    }
    [self.navigationItem setRightBarButtonItems:buttonArray];
}

- (void)sy_setHaveSearchBarRightItemWithTitle:(NSString *)title
                                       action:(SEL)selector {
    [self sy_cleanRightItem];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:selector];
    item.tintColor = [UIColor sy_green4Color];
    [item setTitleTextAttributes:@{NSFontAttributeName: [UIFont sy_font15],
                                   NSForegroundColorAttributeName: [UIColor sy_green4Color]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = item;
}
- (UIButton *)sy_rightButton
{
    return (UIButton *)[[self.navigationItem.rightBarButtonItems safeObjectAtIndex:1] customView];
}
- (UIButton *)sy_leftButton {
    return (UIButton *)[[self.navigationItem.leftBarButtonItems safeObjectAtIndex:1] customView];
}
@end
