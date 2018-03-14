//
//  SCHomePageViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/1/29.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCHomePageViewController.h"
#import <SDCycleScrollView.h>
#import "SCHomePageSectionOneCell.h"
#import "SCHomePageSectionTwoCell.h"
#import "SCCityListController.h"
#import "SCMyAppointmentViewController.h"
#import "SCMakeAnAppointmentprocessController.h"
#import "SCAppointmentProcessViewController.h"
#import "SCOrderListViewController.h"
#import "SCReceiveCouponsViewConroller.h"
#import "SCManager+RequestInterface.h"
#import "SCHomeBannerModel.h"
#import "SCHomeBannerViewController.h"
@interface SCHomePageViewController ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,SCHomePageSectionOneCellDelegate,SCHomePageSectionTwoCellDelegate>
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * headerImageArray;
@property (nonatomic, weak) SDCycleScrollView * cycleScrollView;
@end

@implementation SCHomePageViewController

- (NSMutableArray *)headerImageArray
{
    if (!_headerImageArray) {
        _headerImageArray = [NSMutableArray array];
    }
    return _headerImageArray;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor sc_colorWithf8f8f8];
    [self setupView];
}

- (void)setupView
{
    SDCycleScrollView * cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180) delegate:self placeholderImage:nil];
    self.cycleScrollView = cycleScrollView;
    cycleScrollView.delegate = self;
    
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.tableHeaderView = cycleScrollView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-10-SYTabBarHeight);
    }];
    tableView.mj_header = [SCDIYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [tableView.mj_header beginRefreshing];
}

- (void)loadNewData
{
    [self.headerImageArray removeAllObjects];
    [[SCManager shareInstance] getHomeBannerListWithSuccess:^(NSURLSessionDataTask *serializer, id responseObject) {
        NSArray * bannerArray = [NSArray yy_modelArrayWithClass:[SCHomeBannerModel class] json:responseObject];
        for (SCHomeBannerModel * model in bannerArray) {
            [self.headerImageArray addObject:model.imgName];
        }
        self.cycleScrollView.imageURLStringsGroup = self.headerImageArray;
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        [self.tableView.mj_header endRefreshing];
    }];
}

#pragma mark
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        SCHomePageSectionOneCell * sectionOneCell = [SCHomePageSectionOneCell homePageSectionOneWithTableView:tableView];
        sectionOneCell.delegate = self;
        return sectionOneCell;
    }else{
        SCHomePageSectionTwoCell * twoCell = [SCHomePageSectionTwoCell hoemPageSectionTwoWithTableView:tableView];
        twoCell.delegate = self;
        return twoCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 265;
    }else
    {
        return ((SCREEN_WIDTH - 30)/2)*1.4;
    }
}

#pragma mark 查看更多
- (void)homePageSectionOneCellClickLoadMore
{
//    SCCityListController * cityListController = [[SCCityListController alloc] init];
//    [self.navigationController pushViewController:cityListController animated:YES];

//    SCMyAppointmentViewController * appointmentView = [[SCMyAppointmentViewController alloc] init];
//    [self.navigationController pushViewController:appointmentView animated:YES];

//    SCMakeAnAppointmentprocessController * makeAnAppoint = [[SCMakeAnAppointmentprocessController alloc] init];
//    [self.navigationController pushViewController:makeAnAppoint animated:YES];
    
    SCAppointmentProcessViewController * processViewController = [[SCAppointmentProcessViewController alloc] init];
    [self.navigationController pushViewController:processViewController animated:YES];

//    SCOrderListViewController * listViewController = [[SCOrderListViewController alloc] init];
//    [self.navigationController pushViewController:listViewController animated:YES];
}

- (void)homePageSectionOneCellReceiveCoupons
{
    SCReceiveCouponsViewConroller * receiveCoupons = [[SCReceiveCouponsViewConroller alloc] init];
    [self.navigationController pushViewController:receiveCoupons animated:YES];
}

#pragma mark 洗车美容、换油保养、钣金喷漆、施工直播
- (void)homePageDidSeleItemWitIndex:(NSInteger)index
{
    if (index == 0) {
        
    }else if (index == 1){
        
    }else if (index == 2){
        
    }else if (index == 3){
        
    }
}

#pragma mark SCHomePageSectionTwoCellDelegate
- (void)homePageSectionTwoCellClickWithObj:(id)obj
{
 
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    SCHomeBannerViewController * homeBannerViewController = [[SCHomeBannerViewController alloc] init];
    homeBannerViewController.bannerModel = [self.headerImageArray safeObjectAtIndex:index];
    [self.navigationController pushViewController:homeBannerViewController animated:YES];
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
