//
//  SCHomeTabBarController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/1/29.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCHomeTabBarController.h"
#import "SCMineViewController.h"
#import "SCReservationViewController.h"
#import "SCHomePageViewController.h"
#import "SCBaseNavigationController.h"
#define kWP_TABBAR_TITLE_PADDING (-3)
@interface SCHomeTabBarController ()

@end

@implementation SCHomeTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubClassController];
}

- (void)setupSubClassController
{
    SCHomePageViewController * homePageController = [[SCHomePageViewController alloc] init];
    SCBaseNavigationController * homeNavigationController = [[SCBaseNavigationController alloc]initWithRootViewController:homePageController];
    UITabBarItem * homeBarItem = [self setupTabBarItemWithTitle:@"首页" image:[UIImage imageNamed:@"footer_ico_index_normal"] selectedImage:[UIImage imageNamed:@"footer_ico_index_selcted"]];
    homeNavigationController.tabBarItem = homeBarItem;
    
    
    SCReservationViewController * rservationController = [[SCReservationViewController alloc] init];
    SCBaseNavigationController * rservationNavigationController = [[SCBaseNavigationController alloc]initWithRootViewController:rservationController];
    UITabBarItem * rservationBarItem = [self setupTabBarItemWithTitle:@"门店" image:[UIImage imageNamed:@"footer_ico_store_normal"] selectedImage:[UIImage imageNamed:@"footer_ico_store_selcted"]];
    rservationNavigationController.tabBarItem = rservationBarItem;
    
    
    SCMineViewController * mineController = [[SCMineViewController alloc] init];
    SCBaseNavigationController * mineNavigationController = [[SCBaseNavigationController alloc]initWithRootViewController:mineController];
    UITabBarItem * mineBarItem = [self setupTabBarItemWithTitle:@"我的" image:[UIImage imageNamed:@"footer_ico_me_normal"] selectedImage:[UIImage imageNamed:@"footer_ico_me_selcted"]];
    mineNavigationController.tabBarItem = mineBarItem;
    
    [self setViewControllers:@[homeNavigationController,rservationNavigationController,mineNavigationController]];
    
}

- (UITabBarItem *)setupTabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    UITabBarItem * showTabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectedImage];
    showTabBarItem.titlePositionAdjustment = UIOffsetMake(0, kWP_TABBAR_TITLE_PADDING);
    return showTabBarItem;
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
