//
//  SCAppointmentProcessViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/24.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCAppointmentProcessViewController.h"
#import "SCMakeAnAppointmentprocessController.h"
#import "SCTheirOwnSheetMetalViewController.h"
static const CGFloat KWMMenuViewhHeight = 45;
@interface SCAppointmentProcessViewController ()

@end

@implementation SCAppointmentProcessViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressColor = [UIColor sc_colorWithFC8739];
        self.titleColorSelected = [UIColor sc_colorWithFC8739];
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 16;
        self.titleFontName = kSYFontPingFangSCMedium;
        self.progressWidth = 63;
        self.titleColorNormal = [UIColor sc_colorWith666666];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel * label = [[UILabel alloc] init];
    label.text = @"预约流程";
    label.font = [UIFont sy_boldFont17];
    label.textColor = [UIColor sc_colorWith444444];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake((SCREEN_WIDTH-200)*0.5,20,200,44);

    self.navigationItem.titleView = label;
    self.menuView.style = WMMenuViewStyleLine;
    

    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 30, 44);
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setImage:[UIImage imageNamed:@"title_btn_back"] forState:UIControlStateNormal];
    UIBarButtonItem * leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)leftBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return 2;
}

- (__kindof UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index == 0) {
        SCTheirOwnSheetMetalViewController * sheetMetalViewController = [[SCTheirOwnSheetMetalViewController alloc] init];
        return sheetMetalViewController;
    }else{
        SCMakeAnAppointmentprocessController * processController = [[SCMakeAnAppointmentprocessController alloc] init];
        return processController;
    }
    
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index
{
    if (index == 0) {
        return @"自费钣金";
    }else{
        return @"保险钣金";
    }
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
