//
//  SCNoPayViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/26.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCNoPayListViewController.h"
#import "SCOrderListCell.h"
#import "SCOrderListModel.h"
#import "SCManager+RequestInterface.h"
#import "SCOrderConfirmationViewController.h"
@interface SCNoPayListViewController ()
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@end

@implementation SCNoPayListViewController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor sc_colorWithF4F4F4];
    [self setupView];
}

- (void)setupView
{
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.backgroundColor = [UIColor sc_colorWithF4F4F4];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(10);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.mj_header = [SCDIYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    [tableView.mj_header beginRefreshing];
}



//- (void)update

- (void)loadData
{
    [self loadNewDataWithOrderState:1];
}

- (void)loadNewDataWithOrderState:(NSInteger)orderState
{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd+HH:mm:ss"];
    //用[NSDate date]可以获取系统当前时间
    NSString * currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    [[SCManager shareInstance] getOrderListWithOrderState:orderState length:10 createTime:currentDateStr success:^(NSURLSessionDataTask *serializer, id responseObject) {
        NSArray * listArray = [responseObject objectForKey:@"list"];
        NSArray * dataArray = [NSArray yy_modelArrayWithClass:[SCOrderListModel class] json:listArray];
        self.dataArray = [dataArray mutableCopy];
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
  
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
    
}

- (void)loadMoreData
{
    
}

#pragma mark

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCOrderListCell * cell = [SCOrderListCell orderListCellWithTableView:tableView orderType:1];
    cell.listModel = [self.dataArray safeObjectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [SCOrderListCell cellHeightWithOrderType:1];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCOrderConfirmationViewController * confirmationViewController = [[SCOrderConfirmationViewController alloc] init];
    SCOrderListModel * listModel =  [self.dataArray safeObjectAtIndex:indexPath.row];
    confirmationViewController.listModel = listModel;
    [self.navigationController pushViewController:confirmationViewController animated:YES];
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
