//
//  SCOrderViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/25.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCOrderViewController.h"

@interface SCOrderViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SCOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"我的订单"];
    [self sy_leftBarButtonItem];
    [self setupView];
}

- (void)setupView
{
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
  
    UIView * tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    tableView.tableHeaderView = tableHeaderView;
    tableHeaderView.backgroundColor = [UIColor sc_colorwithFED832];
    
    UILabel * orderStateLabel = [[UILabel alloc] init];
    [tableHeaderView addSubview:orderStateLabel];
    orderStateLabel.textAlignment = NSTextAlignmentCenter;
    orderStateLabel.font = [UIFont sy_font17];
    orderStateLabel.textColor = [UIColor sc_colorWith444444];
    [orderStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tableHeaderView.mas_top).with.offset(20);
        make.width.mas_equalTo(75);
        make.centerX.mas_equalTo(tableHeaderView.mas_centerX);
    }];
    
    UIView * leftSegmentView = [[UIView alloc] init];
    [tableHeaderView addSubview:leftSegmentView];
    leftSegmentView.backgroundColor = [UIColor sc_colorWithF9F4DE];
    
    UIView * rightSegmentView = [[UIView alloc] init];
    [tableHeaderView addSubview:rightSegmentView];
    rightSegmentView.backgroundColor = [UIColor sc_colorWithF9F4DE];
    
    [leftSegmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tableHeaderView.mas_top).with.offset(20);
        make.width.mas_equalTo(75);
        make.right.equalTo(orderStateLabel.mas_left).with.offset(-12);
    }];
    
    [rightSegmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tableHeaderView.mas_top).with.offset(20);
        make.width.mas_equalTo(75);
        make.left.equalTo(orderStateLabel.mas_right).with.offset(12);
    }];
    
    UILabel * paymentTimeLabel = [[UILabel alloc] init];
    [tableHeaderView addSubview:paymentTimeLabel];
    orderStateLabel.textAlignment = NSTextAlignmentCenter;
    [paymentTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tableHeaderView.mas_left).with.offset(0);
        make.right.equalTo(tableHeaderView.mas_right).with.offset(-0);
        make.top.equalTo(orderStateLabel.mas_bottom).with.offset(20);
    }];
    
    UILabel * paymentTipsLabel = [[UILabel alloc] init];
    [tableHeaderView addSubview:paymentTipsLabel];
    paymentTipsLabel.textAlignment = NSTextAlignmentCenter;
    paymentTipsLabel.font = [UIFont sy_font12];
    paymentTipsLabel.textColor = [UIColor cdf_colorWithHexString:@"6C6DFD" alpha:0.84];
    paymentTipsLabel.text = @"超过付款时限，订单将自动关闭";
    [paymentTipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tableHeaderView.mas_left).with.offset(0);
        make.right.equalTo(tableHeaderView.mas_right).with.offset(-0);
        make.top.equalTo(orderStateLabel.mas_bottom).with.offset(22);
    }];
}
#pragma mark
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
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
