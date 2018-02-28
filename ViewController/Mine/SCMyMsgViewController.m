//
//  SCMyMsgViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/28.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMyMsgViewController.h"
#import "SCMyMsgModel.h"
#import "SCMyMsgCell.h"
@interface SCMyMsgViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@end

@implementation SCMyMsgViewController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"我的消息"];
    [self sy_leftBarButtonItem];
    [self setupView];
    [self initWithData];
}

/*
 imageName;
 msgType;
 lastMsg;
 */
- (void)initWithData
{

    SCMyMsgModel * model = [[SCMyMsgModel alloc] init];
    model.imageName = @"";
    model.msgType = @"系统消息";
    [self.dataArray addObject:model];
    
    SCMyMsgModel * modelTwo = [[SCMyMsgModel alloc] init];
    modelTwo.imageName = @"";
    modelTwo.msgType = @"预约消息";
    [self.dataArray addObject:modelTwo];
    
    SCMyMsgModel * modelThree = [[SCMyMsgModel alloc] init];
    modelThree.imageName = @"";
    modelThree.msgType = @"优惠券消息";
    [self.dataArray addObject:modelThree];
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
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
    }];
}

#pragma mark

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCMyMsgModel * model = [self.dataArray safeObjectAtIndex:indexPath.row];
    SCMyMsgCell * cell = [SCMyMsgCell myMsgCellWithTabeleView:tableView withObj:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [SCMyMsgCell cellHeight];
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
