//
//  SCEvaluationViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/1.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCEvaluationViewController.h"
#import "SCEvaluateRowOneTableViewCell.h"
#import "SCEvaluateRowTwoTableViewCell.h"
@interface SCEvaluationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;
@end

@implementation SCEvaluationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"评价"];
    [self sy_leftBarButtonItem];
    [self setupView];
}

- (void)setupView
{
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.backgroundColor = [UIColor sc_colorWithf8f8f8];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(10);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-45);
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIButton * submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:submitBtn];
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(45);
    }];
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}

#pragma mark
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        SCEvaluateRowOneTableViewCell * cell = [SCEvaluateRowOneTableViewCell evaluateRowOneTableViewCellWithTableView:tableView];
        cell.listModel = self.listModel;
        return cell;
    }else{
        SCEvaluateRowTwoTableViewCell * cell = [SCEvaluateRowTwoTableViewCell evaluateRowTwoTableViewCellWithTableView:tableView];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return [SCEvaluateRowOneTableViewCell cellHeight];
    }else{
        return [SCEvaluateRowTwoTableViewCell cellHeight];
    }
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
