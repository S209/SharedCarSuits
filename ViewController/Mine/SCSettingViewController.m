//
//  SCSettingViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/12.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCSettingViewController.h"

@interface SCSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, copy) NSArray * contentArray;
@end

@implementation SCSettingViewController
- (NSArray *)contentArray
{
    if (!_contentArray) {
        _contentArray = [[NSArray alloc] initWithObjects:@"意见反馈",@"应用评分",@"应用简介",@"软件版本", nil];
    }
    return _contentArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"设置"];
    [self sy_leftBarButtonItem];
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
        make.top.equalTo(self.view.mas_top).with.offset(5);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
}
#pragma mark
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 2;
    }else if (section == 2){
        return 1;
    }else if (section == 3){
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        UITableViewCell * ideaFeedBack = [tableView dequeueReusableCellWithIdentifier:@"ideaFeedBackIdDES"];
        if (!ideaFeedBack) {
            ideaFeedBack = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ideaFeedBackIdDES"];
            UILabel * ideaFeedBackLabel = [[UILabel alloc] init];
            [ideaFeedBack.contentView addSubview:ideaFeedBack];
            ideaFeedBackLabel.text = @"意见反馈";
            ideaFeedBackLabel.textAlignment = NSTextAlignmentLeft;
            ideaFeedBackLabel.frame = CGRectMake(20, 17, 200, 17);
            ideaFeedBackLabel.font = [UIFont sy_font16];
            ideaFeedBackLabel.textColor = [UIColor sc_colorWith444444];
        }
        ideaFeedBack.accessoryType =
        return ideaFeedBack;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0 || section == 1) {
        UIView * footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
        footView.backgroundColor = [UIColor sc_colorWihtf8f8f8];
        return footView;
    }else if (section == 2){
        UIView * footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
        footView.backgroundColor = [UIColor sc_colorWihtf8f8f8];
        return footView;
    }
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }else if (section == 1){
        return 10;
    }else if (section == 2){
        return 60;
    }
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
