//
//  SCMineViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/1/29.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMineViewController.h"
#import "SCMineViewHeaderView.h"
#import "SCMineViewControllerSectionCell.h"
#import "SCSettingViewController.h"
#import "SCEditorUserInfoViewController.h"
#import "SCMyGarageViewController.h"
#import "SCUserModel.h"
#import "SCOrderListViewController.h"
@interface SCMineViewController()<UITableViewDelegate,UITableViewDataSource,SCMineViewHeaderViewDelegate>
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, weak) SCMineViewHeaderView * headerView;
@property (nonatomic, copy) NSArray * contentArray;
@property (nonatomic, copy) NSArray * contentImgArray;
@property (nonatomic, strong) SCUserModel * userModel;
@end
@interface SCMineViewController ()

@end

@implementation SCMineViewController

- (NSArray *)contentArray
{
    if (!_contentArray) {
        _contentArray = @[@"我的订单",@"我的积分",@"我的消息",@"设置"];
    }
    return _contentArray;
}
- (NSArray *)contentImgArray
{
    if (!_contentImgArray) {
        _contentImgArray = @[@"me_list_order",@"me_list_score",@"me_list_information",@"me_list_setting"];
    }
    return _contentImgArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary * userDict = [[NSUserDefaults standardUserDefaults] objectForKey:SCLoginModelUserDict];
    SCUserModel  * userModel = [SCUserModel yy_modelWithDictionary:userDict];
    self.userModel = userModel;
    [self setNavigationWithTitle:@"个人资料"];
    [self setupView];
}

- (void)setupView
{
    UITableView * tableView = [[UITableView alloc] init];
    tableView.backgroundColor = [UIColor sc_colorWihtf8f8f8];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
    
    SCMineViewHeaderView * headerView = [[SCMineViewHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 282)];
    headerView.userModel = self.userModel;
    tableView.tableHeaderView = headerView;
    headerView.delegate = self;
}

#pragma mark
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCMineViewControllerSectionCell * cell = [SCMineViewControllerSectionCell mineWithTableView:tableView];
    
    if (indexPath.section == 0) {
        [cell updateContentWithImageName:[self.contentImgArray safeObjectAtIndex:indexPath.row] content:[self.contentArray safeObjectAtIndex:indexPath.row]];
    }else{
        [cell updateContentWithImageName:[NSString stringWithFormat:@"me_list_setting"] content:@"设置"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        UIView * footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
        footView.backgroundColor = [UIColor sc_colorWihtf8f8f8];
        return footView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }
    return 0.0;
}

/*
 我的订单 我的积分 我的消息
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            SCOrderListViewController * orderListController = [[SCOrderListViewController alloc] init];
            [self.navigationController pushViewController:orderListController animated:YES];
        }
    }else if (indexPath.section == 1){
        SCSettingViewController * settingController = [[SCSettingViewController alloc] init];
        [self.navigationController pushViewController:settingController animated:YES];
    }
    
}

- (void)mineViewHeaderViewClickEditor
{
    SCEditorUserInfoViewController * editorController = [[SCEditorUserInfoViewController alloc] init];
    editorController.userModel = self.userModel;
    [self.navigationController pushViewController:editorController animated:YES];
}

- (void)mineViewHeaderMyGarage
{
    SCMyGarageViewController * myGarageViewController = [[SCMyGarageViewController alloc] init];
    [self.navigationController pushViewController:myGarageViewController animated:YES];
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
