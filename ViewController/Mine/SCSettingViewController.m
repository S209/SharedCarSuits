//
//  SCSettingViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/12.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCSettingViewController.h"
#import "AppDelegate.h"
#import "SCExitShowTipsView.h"
@interface SCSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, copy) NSArray * contentArray;
@property (nonatomic, assign) NSInteger score;
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
    tableView.backgroundColor = [UIColor sc_colorWithf8f8f8];
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
            ideaFeedBack.selectionStyle = UITableViewCellSelectionStyleNone;
            UILabel * ideaFeedBackLabel = [[UILabel alloc] init];
            [ideaFeedBack.contentView addSubview:ideaFeedBackLabel];
            ideaFeedBackLabel.text = @"意见反馈";
            ideaFeedBackLabel.textAlignment = NSTextAlignmentLeft;
            ideaFeedBackLabel.frame = CGRectMake(20, 17, 200, 17);
            ideaFeedBackLabel.font = [UIFont sy_font16];
            ideaFeedBackLabel.textColor = [UIColor sc_colorWith444444];
        }
        ideaFeedBack.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        return ideaFeedBack;
    }else if (indexPath.section == 1){
     return [self setupViewCellWithTableView:tableView indexPath:indexPath];
    }else if (indexPath.section == 2){
        UITableViewCell * versionCell = [tableView dequeueReusableCellWithIdentifier:@"versionCelliDdes"];
        if (!versionCell) {
            versionCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"versionCelliDdes"];
            versionCell.selectionStyle = UITableViewCellSelectionStyleNone;
            UILabel * ideaFeedBackLabel = [[UILabel alloc] init];
            [versionCell.contentView addSubview:ideaFeedBackLabel];
            ideaFeedBackLabel.text = @"软件版本";
            ideaFeedBackLabel.textAlignment = NSTextAlignmentLeft;
            ideaFeedBackLabel.frame = CGRectMake(20, 17, 200, 17);
            ideaFeedBackLabel.font = [UIFont sy_font16];
            ideaFeedBackLabel.textColor = [UIColor sc_colorWith444444];
            
            UILabel * versionLabel = [[UILabel alloc] init];
            [versionCell.contentView addSubview:versionLabel];
            NSString *string = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
            versionLabel.text = string;
        }
        versionCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return versionCell;
    }else if (indexPath.section == 3){
        UITableViewCell * exitLoginCell = [tableView dequeueReusableCellWithIdentifier:@"exitLoginCellIdDES"];
        if (!exitLoginCell) {
            exitLoginCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"exitLoginCellIdDES"];
            exitLoginCell.textLabel.text = @"退出登录";
            exitLoginCell.selectionStyle = UITableViewCellSelectionStyleNone;
            exitLoginCell.textLabel.textAlignment = NSTextAlignmentCenter;
            exitLoginCell.textLabel.textColor = [UIColor sc_colorWithEC1A1A];
            exitLoginCell.textLabel.font = [UIFont sy_font16];
        }
        return exitLoginCell;
    }
    return nil;
}

- (UITableViewCell *)setupViewCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UITableViewCell * scoreCell = [tableView dequeueReusableCellWithIdentifier:@"scoreCellIdDES"];
        if (!scoreCell) {
            scoreCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"scoreCellIdDES"];
            scoreCell.selectionStyle = UITableViewCellStyleDefault;
            UILabel * scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 17, 200, 17)];
            [scoreCell.contentView addSubview:scoreLabel];
            scoreLabel.text = @"应用评分";
            scoreLabel.font = [UIFont sy_font16];
            scoreLabel.textColor = [UIColor sc_colorWith444444];
            CGFloat startX = 0;
            for (NSUInteger i = 0; i < 5; i++) {
                UIImageView * startView = [[UIImageView alloc] init];
                [scoreCell.contentView addSubview:startView];
                startView.tag = 300+i;
                startX = (SCREEN_WIDTH-101) + (15.5 +3)*i;
                startView.frame = CGRectMake(startX, 17, 15.5, 15);
                [startView setImage:[UIImage imageNamed:@"setting_ico_star_normal"]];
            }
            UIView * segmentView = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5, SCREEN_WIDTH, 0.5)];
            [scoreCell.contentView addSubview:segmentView];
            segmentView.backgroundColor = [UIColor sc_colorWithe5e5e5];
        }
        
        if (self.score > 0) {
            for (NSUInteger i = 0; i < self.score; i++) {
                UIImageView * startView = [scoreCell viewWithTag:300+i];
                [startView setImage:[UIImage imageNamed:@"setting_ico_star_selcted"]];
            }
        }
        return scoreCell;
    }else if(indexPath.row == 1){
        UITableViewCell * introductionCell = [tableView dequeueReusableCellWithIdentifier:@"introductionCellIdDes"];
        if (!introductionCell) {
            introductionCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"introductionCellIdDes"];
            introductionCell.selectionStyle = UITableViewCellStyleDefault;
            UILabel * introductionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 17, 200, 17)];
            [introductionCell.contentView addSubview:introductionLabel];
            introductionLabel.text = @"应用简介";
            introductionLabel.font = [UIFont sy_font16];
            introductionLabel.textColor = [UIColor sc_colorWith444444];
        }
        return introductionCell;
    }
    return nil;
}



- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0 || section == 1) {
        UIView * footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
        footView.backgroundColor = [UIColor sc_colorWithf8f8f8];
        return footView;
    }else if (section == 2){
        UIView * footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
        footView.backgroundColor = [UIColor sc_colorWithf8f8f8];
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 3) {
        [self showExitView];
    }
}

- (void)showExitView
{
    SCExitShowTipsView * exitShowTipsView = [[SCExitShowTipsView alloc] init];
    [exitShowTipsView show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
