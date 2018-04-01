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
#import "SCManager+RequestInterface.h"
@interface SCMyCouponViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, assign) NSInteger pageIndex;
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
    self.view.backgroundColor = [UIColor sc_colorWithf8f8f8];
    [self setupView];
    [self loadNewData];
}

- (void)loadNewData
{
    self.pageIndex = 1;
    [self loadDataWithPage:1 withCouponId:@"0"];
}

- (void)loadMoreData
{
    self.pageIndex += 1;
    SCCouponModel * couponModel = [self.dataArray lastObject];
    NSString *  couponId;
    if (couponModel.cpuponId > 0){
        couponId = [NSString stringWithFormat:@"%zd",couponModel.cpuponId];
    }else{
        couponId = @"0";
    }
    [self loadDataWithPage:self.pageIndex withCouponId:couponId];
}

- (void)loadDataWithPage:(NSInteger)page withCouponId:(NSString *)couponId
{
    NSString * length = [NSString stringWithFormat:@"%zd",10*page];

    WEAKSELF
    [[SCManager shareInstance] myCouponListWithId:couponId andLength:length success:^(NSURLSessionDataTask *serializer, id responseObject) {
        STRONGSELF
        NSInteger ifHave = [[responseObject objectForKey:@"ifHave"] integerValue];
        if (ifHave == 1){
            strongSelf.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        }else{
            strongSelf.tableView.mj_footer = nil;
        }
        if (page == 1){
            [strongSelf.dataArray removeAllObjects];
            [strongSelf.tableView.mj_header endRefreshing];
        }else{
            [strongSelf.tableView.mj_footer endRefreshing];
        }
        NSArray * list = [responseObject objectForKey:@"list"];
        NSArray * listArray = [[NSArray yy_modelArrayWithClass:[SCCouponModel class] json:list] copy];
        [strongSelf.dataArray addObjectsFromArray:listArray];
        [strongSelf.tableView reloadData];
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        
    }];
}

- (void)setupView
{
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor sc_colorWithf8f8f8];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(15);
    }];
    tableView.mj_header = [SCDIYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    tableView.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

#pragma mark
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return self.dataArray.count;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCCouponModel * model = [self.dataArray safeObjectAtIndex:indexPath.row];
    [[NSNotificationCenter defaultCenter] postNotificationName:SCSelectCoupon object:model];
    [self.navigationController popViewControllerAnimated:YES];
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
