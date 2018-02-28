//
//  SCMyCouponViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/28.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMyCouponViewController.h"
#import "SCMyCouponCell.h"
#import "SCCouponModel.h"
@interface SCMyCouponViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@end

@implementation SCMyCouponViewController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"我的优惠券"];
    [self sy_leftBarButtonItem];
    [self setupView];
}

- (void)setupView
{
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor sc_colorWithF4F4F4];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(15);
    }];
}

#pragma mark
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.dataArray.count;
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [SCMyCouponCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    SCCouponModel * model = [self.dataArray safeObjectAtIndex:indexPath.row];
    SCMyCouponCell * cell = [SCMyCouponCell myCouponCellWithTableView:tableView andObj:model];
    return cell;
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
