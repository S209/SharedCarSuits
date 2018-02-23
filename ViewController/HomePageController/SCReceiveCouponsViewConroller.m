//
//  SCReceiveCouponsViewConroller.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/22.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCReceiveCouponsViewConroller.h"

@interface SCReceiveCouponsViewConroller ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;
@end

@implementation SCReceiveCouponsViewConroller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"领取优惠券"];
    [self setupView];
    self.view.backgroundColor = [UIColor sc_colorWith6C6DFD];
}

- (void)setupView
{
    UIImageView * headerImageView = [[UIImageView alloc] init];
    [self.view addSubview:headerImageView];
    headerImageView.clipsToBounds = YES;
    headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    CGFloat height = SCREEN_WIDTH*471/750;
    [headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight);
        make.height.mas_equalTo(height);
    }];
    
    UILabel * receiveCouponsLabel = [[UILabel alloc] init];
    [self.view addSubview:receiveCouponsLabel];
    receiveCouponsLabel.text = @"今日还可以领取";
    receiveCouponsLabel.textAlignment = NSTextAlignmentCenter;
    [receiveCouponsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(headerImageView.mas_bottom).with.offset(0);
    }];
    
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.top.equalTo(receiveCouponsLabel.mas_bottom).with.offset(20);
    }];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
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
