//
//  SCBaseViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/1/29.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCBaseViewController.h"

@interface SCBaseViewController ()

@end

@implementation SCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}



- (BOOL)prefersStatusBarHidden
{
    return NO;
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
