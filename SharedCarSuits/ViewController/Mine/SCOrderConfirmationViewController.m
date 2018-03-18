//
//  SCOrderConfirmationViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/4.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCOrderConfirmationViewController.h"
#import "SCManager+RequestInterface.h"
#import "SCOrderListModel.h"
#import "SCOrderDetailServiceNameViewCell.h"
#import "SCOrderDetailReservationViewCell.h"
#import "SCOrderDetailOrderInfoViewCell.h"
#import "SCOrderDetailPaymentWayViewCell.h"
#import "SCOrderDetailUseACouponCell.h"
@interface SCOrderConfirmationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, weak) UILabel * paymentTimeLabel;
@property (nonatomic, strong) SCOrderListModel * listModel;
@end

@implementation SCOrderConfirmationViewController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sy_leftBarButtonItem];
    [self setNavigationWithTitle:@"订单确认"];
    [self setupView];
}

- (void)setupView
{
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(44);
    }];
    tableView.mj_header = [SCDIYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [tableView.mj_header beginRefreshing];
    tableView.tableHeaderView = [self setupTableHeaderView];
    
    UIView * bottomView = [[UIView alloc] init];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.top.equalTo(tableView.mas_bottom).with.offset(0);
    }];
    
    UILabel * paymentMoneyLabel = [[UILabel alloc] init];
    [bottomView addSubview:paymentMoneyLabel];
    paymentMoneyLabel.font = [UIFont sy_font7];
    [paymentMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.centerY.equalTo(bottomView.mas_centerY);
    }];
    
    UIView * dividingLineView = [[UIView alloc] init];
    [bottomView addSubview:dividingLineView];
    [dividingLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(0.5, 10));
        make.centerY.mas_equalTo(bottomView.mas_centerY);
    }];
    
    UIButton * orderNowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [bottomView addSubview:orderNowBtn];
    orderNowBtn.titleLabel.font = [UIFont sy_font8];
    [orderNowBtn setTitle:@"立即下单" forState:UIControlStateNormal];
    [orderNowBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [orderNowBtn addTarget:self action:@selector(orderNowBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)orderNowBtnClick:(UIButton *)sender
{
    
}

- (UIView *)setupTableHeaderView
{
    UIView * headerView = [[UIView alloc] init];
    headerView.size = CGSizeMake(SCREEN_WIDTH, 60);
    UILabel * orderTitleLabel = [[UILabel alloc] init];
    [headerView addSubview:orderTitleLabel];
    orderTitleLabel.text = @"待支付";
    orderTitleLabel.textAlignment = NSTextAlignmentCenter;
    orderTitleLabel.textColor = [UIColor sc_colorWith444444];
    [orderTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView.mas_left).with.offset(0);
        make.right.equalTo(headerView.mas_right).with.offset(-0);
        make.height.mas_equalTo(55);
    }];
    
    UIView * leftView = [[UIView alloc] init];
    [headerView addSubview:leftView];
    leftView.backgroundColor = [UIColor sc_colorWithCCCCCC];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(orderTitleLabel.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 0.5));
        make.right.equalTo(orderTitleLabel.mas_centerX).with.offset(-37);
    }];
    
    UIView * rightView = [[UIView alloc] init];
    [headerView addSubview:rightView];
    rightView.backgroundColor = [UIColor sc_colorWithCCCCCC];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(orderTitleLabel.mas_centerY);
        make.left.equalTo(orderTitleLabel.mas_centerX).with.offset(37);
        make.size.mas_equalTo(CGSizeMake(60, 0.5));
    }];
    
    UILabel * paymentTimeLabel = [[UILabel alloc] init];
    [headerView addSubview:paymentTimeLabel];
    self.paymentTimeLabel = paymentTimeLabel;
    [paymentTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView.mas_left).with.offset(0);
        make.right.equalTo(headerView.mas_right).with.offset(-0);
        make.top.equalTo(orderTitleLabel.mas_bottom).with.offset(10);
    }];
    
    
    UILabel * tipsLabel = [[UILabel alloc] init];
    tipsLabel.text = @"超过付款时限，订单将自动关闭";
    [headerView addSubview:tipsLabel];
    [tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView.mas_left).with.offset(0);
        make.right.equalTo(headerView.mas_right).with.offset(-0);
        make.top.equalTo(paymentTimeLabel.mas_bottom).with.offset(10);
    }];
    headerView.backgroundColor = [UIColor sc_colorWithF9F4DE];
    return headerView;
}

- (void)loadNewData
{
    if (_createTime.length == 0) {
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //设定时间格式,这里可以设置成自己需要的格式
        [dateFormatter setDateFormat:@"yyyy-MM-dd+HH:mm:ss"];
        //用[NSDate date]可以获取系统当前时间
        NSString * currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
        _createTime = currentDateStr;
    }
    
    [[SCManager shareInstance] getOrderListWithOrderState:_orderType length:10 createTime:_createTime success:^(NSURLSessionDataTask *serializer, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        NSArray * listArray = [responseObject objectForKey:@"list"];
        NSArray * dataArray = [NSArray yy_modelArrayWithClass:[SCOrderListModel class] json:listArray];
        self.dataArray = [dataArray mutableCopy];
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        [self.tableView.mj_header endRefreshing];
    }];
}


#pragma mark

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        SCOrderDetailServiceNameViewCell * cell = [SCOrderDetailServiceNameViewCell orderDetailServiceNameViewCellWithTableView:tableView price:self.listModel.price];
        return cell;
    }else if (indexPath.section == 1){
        SCOrderDetailReservationViewCell * cell = [SCOrderDetailReservationViewCell orderDetailReservationViewCellWithTableView:tableView];
        cell.listModel = self.listModel;
        return cell;
    }else if (indexPath.section == 2){
        SCOrderDetailOrderInfoViewCell * cell = [SCOrderDetailOrderInfoViewCell orderDetailOrderInfoViewCellWithTableView:tableView];
        cell.listModel = self.listModel;
        return cell;
    }else if (indexPath.section == 3){
        SCOrderDetailPaymentWayViewCell * cell = [SCOrderDetailPaymentWayViewCell orderDetailPaymentWayViewCellWithTabeleView:tableView];
        return cell;
    }else {
        SCOrderDetailUseACouponCell * cell = [SCOrderDetailUseACouponCell orderDetailUseACouponCellWithTabeleView:tableView];
        return cell;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [SCOrderDetailServiceNameViewCell cellHeight];
    }else if (indexPath.section == 1){
        return [SCOrderDetailReservationViewCell cellHeight];
    }else if (indexPath.section == 2){
        return [SCOrderDetailOrderInfoViewCell cellHeight];
    }else if (indexPath.section == 3){
        return [SCOrderDetailPaymentWayViewCell cellHeight];
    }else{
        return [SCOrderDetailUseACouponCell cellHeight];
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
