//
//  SCReservationController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/1/29.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCReservationViewController.h"
#import "SCReservationViewCell.h"
#import "SCDIYHeader.h"
#import "SCManager+RequestInterface.h"
#import "SCShopListModel.h"
#import "SCManager+CommonMethods.h"
@interface SCReservationViewController () <UITableViewDelegate,UITableViewDataSource,SCReservationViewCellDelegate>
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, weak) UIImageView * networkNerrorImageView;
@property (nonatomic, weak) UILabel * networkNerrorLabel;
@end

@implementation SCReservationViewController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor sc_colorWihtf8f8f8];
    [self setNavigationWithTitle:@"门店"];
    [self setupView];
//    [self loadNewData];
}

- (void)loadNewData
{
    self.currentPage = 1;
    [self.dataArray removeAllObjects];
    [self loadDataWithPage:self.currentPage];
}

- (void)loadMoreData
{
    self.currentPage += 1;
    [self loadDataWithPage:self.currentPage];
}

- (void)loadDataWithPage:(NSInteger)page
{
    SCShopListModel * model = [self.dataArray lastObject];
    NSString * shopIdString;
    if (model.shopId > 0) {
        shopIdString = [NSString stringWithFormat:@"%zd",model.shopId];
    }else{
        shopIdString = @"0";
    }
    NSString * locationString = [[SCManager shareInstance] getPosition];
    [[SCManager shareInstance] shopListWithId:shopIdString length:@"10" location:@"117.319621;31.881049" success:^(NSURLSessionDataTask *serializer, id responseObject) {
        NSInteger ifHave = [[responseObject objectForKey:@"ifHave"] integerValue];
        if (ifHave) {
            self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        }else{
            self.tableView.mj_footer = nil;
        }
        if (page == 1) {
            [self.tableView.mj_header endRefreshing];
        }else{
            [self.tableView.mj_footer endRefreshing];
        }
        
        NSArray * listJSONArray = [responseObject objectForKey:@"list"];
        NSArray * listDataArray = [NSArray yy_modelArrayWithClass:[SCShopListModel class] json:listJSONArray];
        [self.dataArray addObjectsFromArray:listDataArray];
        [self.tableView reloadData];
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        
    }];
}

- (void)setupView
{
//    UITableView * tableView = [[UITableView alloc] init];
//    [self.view addSubview:tableView];
//    tableView.backgroundColor = [UIColor sc_colorWihtf8f8f8];
//    self.tableView = tableView;
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left).with.offset(0);
//        make.top.equalTo(self.view.mas_top).with.offset(10);
//        make.right.equalTo(self.view.mas_right).with.offset(-0);
//        make.bottom.equalTo(self.view.mas_bottom).with.offset(-SYTabBarHeight);
//    }];
//    tableView.mj_header = [SCDIYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];

    
    UIImageView * networkNerrorImageView = [[UIImageView alloc] init];
    [self.view addSubview:networkNerrorImageView];
    [networkNerrorImageView setImage:[UIImage imageNamed:@"default_no_network"]];
    self.networkNerrorImageView = networkNerrorImageView;
    [self.networkNerrorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(160, 160));
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY).with.offset(-5);
    }];
    
    
    UILabel * networkNerrorLabel = [[UILabel alloc] init];
    [self.view addSubview:networkNerrorLabel];
    networkNerrorLabel.numberOfLines = 2;
    networkNerrorLabel.textAlignment = NSTextAlignmentCenter;
    self.networkNerrorLabel = networkNerrorLabel;
    networkNerrorLabel.text = @"网络请求失败\n请点击空白位置重试";
    networkNerrorLabel.font = [UIFont sy_font14];
    networkNerrorLabel.textColor = [UIColor sc_colorWith999999];
    [self.networkNerrorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.networkNerrorImageView.mas_bottom).with.offset(-50);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(250);
    }];
    
}

#pragma mark
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCReservationViewCell * cell = [SCReservationViewCell reservationViewCellWithTableView:tableView];
    cell.delegate = self;
    cell.shopModel = [self.dataArray safeObjectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 230;
}

//设置默认
- (void)reservationViewCellDefaultWithModel:(SCShopListModel *)listModel
{
    [[SCManager shareInstance] shopDefaultWithId:[NSString stringWithFormat:@"%zd",listModel.shopId] success:^(NSURLSessionDataTask *serializer, id responseObject) {
        [self.tableView reloadData];
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        
    }];
}

//查看门店信息
- (void)reservationViewCellCheckStoreInfoWithModel:(SCShopListModel *)listModel
{
    
}
//导航
- (void)reservationViewCellNavigationWithModel:(SCShopListModel *)listModel
{
    NSString * location = listModel.location;
    
    
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
