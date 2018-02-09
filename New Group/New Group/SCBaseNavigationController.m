//
//  SCBaseNavigationController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/1/29.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCBaseNavigationController.h"

@interface SCBaseNavigationController ()

@end

@implementation SCBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
//        viewController.navigationItem.leftBarButtonItem =
//        [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"IMAGENAME"]
//                                         style:UIBarButtonItemStylePlain target:self action:@selector(back)];//统一设置左上角返回键
    }
    [super pushViewController:viewController animated:animated];
}
//- (void)back{
//    [self popViewControllerAnimated:YES];
//}
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
