//
//  SCOrderDetailViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/19.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCOrderDetailViewController.h"
#import "SCOrderDetailServiceNameViewCell.h"
#import "SCOrderDetailReservationViewCell.h"
#import "SCOrderDetailOrderInfoViewCell.h"
#import "SCManager+RequestInterface.h"
#import "SCOrderListModel.h"
#import "SCEvaluationViewController.h"
@interface SCOrderDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;
@end

@implementation SCOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sy_leftBarButtonItem];
    [self setNavigationWithTitle:@"我的订单"];
    [self setupView];
    self.view.backgroundColor = [UIColor sc_colorWithF4F4F4];
    if (_OrderType == 3 || _OrderType == 2) {//已完成
        [self setUpBottomView];
    }
}

- (void)setupView
{
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.backgroundColor = [UIColor sc_colorWithF4F4F4];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(5);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-45);
    }];
}

#pragma mark
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        SCOrderDetailServiceNameViewCell * cell = [SCOrderDetailServiceNameViewCell orderDetailServiceNameViewCellWithTableView:tableView];
        cell.listModel = self.listModel;
        return cell;
    }else if (indexPath.row ==1){
        SCOrderDetailReservationViewCell * cell = [SCOrderDetailReservationViewCell orderDetailReservationViewCellWithTableView:tableView];
        cell.listModel = self.listModel;
        return cell;
    }else{
        SCOrderDetailOrderInfoViewCell * cell = [SCOrderDetailOrderInfoViewCell orderDetailOrderInfoViewCellWithTableView:tableView];
        cell.listModel = self.listModel;
        cell.orderType = self.OrderType;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return  [SCOrderDetailServiceNameViewCell cellHeight];
    }else if (indexPath.row == 1){
        return [SCOrderDetailReservationViewCell cellHeight];
    }else{
        return [SCOrderDetailOrderInfoViewCell cellHeightWithOrderType:_OrderType];
    }
}

#pragma mark

- (void)setUpBottomView
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor whiteColor];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(45);
    }];
   
    btn.titleLabel.font = [UIFont sy_font16];
   
    if (_OrderType == 3) {//已完成
        [btn setTitle:@"我要评价" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor sc_colorWithFC8739] forState:UIControlStateNormal];
    }else if(_OrderType == 2){//已取消
        [btn setTitleColor:[UIColor sc_colorWith666666] forState:UIControlStateNormal];
        [btn setTitle:@"取消预约" forState:UIControlStateNormal];
    }
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}


- (void)btnClick
{
    if (_OrderType == 3) {
        SCEvaluationViewController * evaluationViewController = [[SCEvaluationViewController alloc] init];
        evaluationViewController.listModel = self.listModel;
        [self.navigationController pushViewController:evaluationViewController animated:YES];
    }else if(_OrderType == 2){
        [[SCManager shareInstance] cancenOrderWithOrderType:[NSString stringWithFormat:@"%zd",_OrderType] orderId:self.listModel.orderId success:^(NSURLSessionDataTask *serializer, id responseObject) {
            
        } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
            
        } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
            
        }];
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
