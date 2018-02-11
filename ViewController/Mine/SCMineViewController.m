//
//  SCMineViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/1/29.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMineViewController.h"
#import "SCMineViewHeaderView.h"
@interface SCMineViewController()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, weak) SCMineViewHeaderView * headerView;
@end
@interface SCMineViewController ()

@end

@implementation SCMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人资料";
    [self setupView];
}

- (void)setupView
{
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;

    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
    
    SCMineViewHeaderView * headerView = [[SCMineViewHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 226)];
    tableView.tableHeaderView = headerView;
}

#pragma mark

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
