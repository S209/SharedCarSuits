//
//  SCOrderListViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/26.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCOrderListViewController.h"
#import "SCNoPayListViewController.h"
#import "SCPayedListViewController.h"
#import "SCCompleteOrderListViewController.h"
#import "SCOrderCancelListViewController.h"

static const CGFloat KWMMenuViewhHeight = 45;
@interface SCOrderListViewController ()

@end

@implementation SCOrderListViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressColor = [UIColor sc_colorWithFC8739];
        self.titleColorSelected = [UIColor sc_colorWithFC8739];
        self.titleSizeNormal = 14;
        self.titleSizeSelected = 14;
        self.titleFontName = kSYFontPingFangSCMedium;
        self.progressWidth = 63;
        self.titleColorNormal = [UIColor sc_colorWith666666];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel * label = [[UILabel alloc] init];
    label.text = @"我的订单";
    label.font = [UIFont sy_boldFont17];
    label.textColor = [UIColor sc_colorWith444444];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, SYStatusBarHeight, SCREEN_WIDTH, 44);
    
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 30, 44);
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setImage:[UIImage imageNamed:@"title_btn_back"] forState:UIControlStateNormal];
    UIBarButtonItem * leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    self.navigationItem.titleView = label;
    self.menuView.style = WMMenuViewStyleLine;
}

#pragma mark leftBtnClick
- (void)leftBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return 4;
}

- (__kindof UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index == 0) {
        SCNoPayListViewController * noPayListController = [[SCNoPayListViewController alloc] init];
        return noPayListController;
    }else if(index == 1){
        SCPayedListViewController * payedListController = [[SCPayedListViewController alloc] init];
        return payedListController;
    }else if (index == 2){
        SCCompleteOrderListViewController * completeOrderController = [[SCCompleteOrderListViewController alloc] init];
        return completeOrderController;
    }else if (index == 3){
        SCOrderCancelListViewController * orderCancelController = [[SCOrderCancelListViewController alloc] init];
        return orderCancelController;
    }
    return nil;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index
{
    if (index == 0) {
        return @"待付款";
    }else if(index == 1){
        return @"已付款";
    }else if (index == 2){
        return @"已完成";
    }else if (index == 3){
        return @"已取消";
    }
    return @"";
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    
    return CGRectMake(0, 0, SCREEN_WIDTH, KWMMenuViewhHeight);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = KWMMenuViewhHeight;
    return CGRectMake(0, originY, SCREEN_WIDTH, self.view.frame.size.height - originY);
}

- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index {
    CGFloat width = [super menuView:menu widthForItemAtIndex:index];
    return width + 20;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
