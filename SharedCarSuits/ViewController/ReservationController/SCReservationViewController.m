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
#import "SCViewStorePicturesView.h"
#import "SCNavigationController.h"
#import "SCUserModel.h"
#import "SCMyGarageListPageModel.h"
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
    self.view.backgroundColor = [UIColor sc_colorWithf8f8f8];
    [self setNavigationWithTitle:@"门店"];
    [self setupView];
}

- (void)setAppointmentProcess:(BOOL)appointmentProcess
{
    _appointmentProcess = appointmentProcess;
    if (appointmentProcess) {
        [self sy_leftBarButtonItem];
    }
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
    
    [[SCManager shareInstance] getPositionWithGetPositionBlock:^(NSString *latitudeAndLongitude) {
        [[SCManager shareInstance] shopListWithId:shopIdString length:@"10" location:latitudeAndLongitude success:^(NSURLSessionDataTask *serializer, id responseObject) {
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
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
            self.networkNerrorImageView.hidden = NO;
            self.networkNerrorLabel.hidden = NO;
        }];
    } getGeocoderBlock:^(NSString *geocoderString) {
        UIButton * rightItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightItemBtn.frame = CGRectMake(0, 0, 60, 44);
        [rightItemBtn addTarget:self action:@selector(rightItemBtnClick) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightItemBtn];
        self.navigationItem.rightBarButtonItem = rightBarItem;
        [rightItemBtn setTitle:geocoderString forState:UIControlStateNormal];
        rightItemBtn.titleLabel.font = [UIFont sy_font13];
        [rightItemBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        [rightItemBtn setTitleColor:[UIColor sc_colorWith6C6DFD] forState:UIControlStateNormal];
        [rightItemBtn setImage:[UIImage imageNamed:@"title_btn_location"] forState:UIControlStateNormal];
    }];
    
}

- (void)rightItemBtnClick
{
    
}

- (void)setupView
{
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.backgroundColor = [UIColor sc_colorWithf8f8f8];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.top.equalTo(self.view.mas_top).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-SYTabBarHeight);
    }];
    tableView.mj_header = [SCDIYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [tableView.mj_header beginRefreshing];
    
    UIImageView * networkNerrorImageView = [[UIImageView alloc] init];
    [self.view addSubview:networkNerrorImageView];
    networkNerrorImageView.hidden = YES;
    [networkNerrorImageView setImage:[UIImage imageNamed:@"default_no_network"]];
    self.networkNerrorImageView = networkNerrorImageView;
    [self.networkNerrorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(160, 160));
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY).with.offset(-5);
    }];
    
    UILabel * networkNerrorLabel = [[UILabel alloc] init];
    [self.view addSubview:networkNerrorLabel];
    networkNerrorLabel.hidden = YES;
    networkNerrorLabel.numberOfLines = 2;
    networkNerrorLabel.textAlignment = NSTextAlignmentCenter;
    self.networkNerrorLabel = networkNerrorLabel;
    networkNerrorLabel.text = @"网络请求失败\n请点击空白位置重试";
    networkNerrorLabel.font = [UIFont sy_font14];
    networkNerrorLabel.textColor = [UIColor sc_colorWith999999];
    [networkNerrorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.networkNerrorImageView.mas_bottom).with.offset(-45);
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
          [self loadNewData];
        if (self.appointmentProcess) {
            SCMyGarageListPageModel * carModel = [SCMyGarageListPageModel yy_modelWithDictionary:responseObject];
            if (carModel) {
                SCUserModel * userModel = [SCManager getUserModel];
                NSMutableArray * carArray = [userModel.cars mutableCopy];
                [carArray addObject:carModel];
                [SCManager setUserModel:userModel];
            }
            [self.navigationController popViewControllerAnimated:YES];
        }
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        
    }];
}

//查看门店信息
- (void)reservationViewCellCheckStoreInfoWithModel:(SCShopListModel *)listModel
{
    SCViewStorePicturesView * picturesView = [[SCViewStorePicturesView alloc] init];
    [picturesView show];
    picturesView.panorama = listModel.panorama;
}

//导航
- (void)reservationViewCellNavigationWithModel:(SCShopListModel *)listModel
{
    SCNavigationController * controller = [[SCNavigationController alloc] init];
    controller.listModel = listModel;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCShopListModel * listModel = [self.dataArray safeObjectAtIndex:indexPath.row];
    SCNavigationController * controller = [[SCNavigationController alloc] init];
    controller.listModel = listModel;
    [self.navigationController pushViewController:controller animated:YES];
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
