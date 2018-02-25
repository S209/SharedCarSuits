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

@interface SCHomePageViewController ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,SCHomePageSectionOneCellDelegate,SCHomePageSectionTwoCellDelegate>

@end

@implementation SCHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor sc_colorWihtf8f8f8];
    [self setupView];
}

- (void)setupView
{
    SDCycleScrollView * cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180) delegate:self placeholderImage:nil];
    cycleScrollView.imageURLStringsGroup = @[];
    
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.tableHeaderView = cycleScrollView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-10-SYTabBarHeight);
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
