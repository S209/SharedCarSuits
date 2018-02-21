//
//  SCMyGarageViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMyGarageViewController.h"
#import "SCMyGarageViewCell.h"
#import "SCMyGarageViewDeletViewAlertView.h"
#import "SCManager+RequestInterface.h"
@interface SCMyGarageViewController ()<UITableViewDataSource,UITableViewDelegate,SCMyGarageViewCellDelegate>
@property (nonatomic, strong)NSMutableArray * dataArray;
@end

@implementation SCMyGarageViewController
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
    [self setNavigationWithTitle:@"我的车库"];
    [self setupView];
}


- (void)setupView
{
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight+10);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
    tableView.backgroundColor = [UIColor sc_colorWihtf8f8f8];
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
    SCMyGarageViewCell * viewCell = [SCMyGarageViewCell myGarageViewCellWithTable:tableView];
    viewCell.delegate = self;
    SCMyGarageListPageModel * pageModel = [self.dataArray safeObjectAtIndex:indexPath.row];
    viewCell.pageModel = pageModel;
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

#pragma mark SCMyGarageViewCellDelegate
- (void)myGarageViewCellClickEditor
{
   
}

- (void)myGarageViewCellClickDeleteWithCarName:(NSString *)carName
{
    SCMyGarageViewDeletViewAlertView * deleteView = [[SCMyGarageViewDeletViewAlertView alloc] init];
    [deleteView showWithCarName:carName];
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
