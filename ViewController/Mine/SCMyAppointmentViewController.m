//
//  SCMyAppointmentViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/23.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMyAppointmentViewController.h"
#import "SCMyAppointmentViewCell.h"
#import "SCReservationAlertView.h"
@interface SCMyAppointmentViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@end

@implementation SCMyAppointmentViewController
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"预约流程"];
    [self sy_leftBarButtonItem];
    [self setupView];
}

- (void)setupView
{
    UIImageView * timeImageView = [[UIImageView alloc] init];
    [self.view addSubview:timeImageView];
    [timeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(30);
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(13, 13));
    }];
    [timeImageView setImage:[UIImage imageNamed:@"hyby_ico_time"]];
    
    UILabel * choiseTimeLabel = [[UILabel alloc] init];
    [self.view addSubview:choiseTimeLabel];
    choiseTimeLabel.text = @"请选择预约时间";
    [choiseTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(timeImageView.mas_right).with.offset(5);
        make.top.equalTo(self.view.mas_top).with.offset(25);
        make.width.mas_equalTo(200);
    }];
    choiseTimeLabel.font = [UIFont sy_boldFont16];
    choiseTimeLabel.textColor = [UIColor sc_colorWith444444];
    
    
    UIButton * tomorrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:tomorrowBtn];
    [tomorrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).with.offset(-25);
        make.top.equalTo(choiseTimeLabel.mas_top).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    [tomorrowBtn setTitleColor:[UIColor cdf_colorWithHexString:@"999999" alpha:0.99] forState:UIControlStateNormal];
    [tomorrowBtn setTitle:@"明日" forState:UIControlStateNormal];
    [tomorrowBtn addTarget:self action:@selector(tomorrowBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    tomorrowBtn.titleLabel.font = [UIFont sy_boldFont14];

    UIButton * todayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:todayBtn];
    [todayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).with.offset(-78);
        make.top.equalTo(choiseTimeLabel.mas_top).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    todayBtn.titleLabel.font = [UIFont sy_boldFont14];
    [todayBtn setTitleColor:[UIColor sc_colorWithFC8739] forState:UIControlStateNormal];
    [todayBtn setTitle:@"今日" forState:UIControlStateNormal];
    [todayBtn addTarget:self action:@selector(todayBtnClick:) forControlEvents:UIControlEventTouchUpInside];

  
    NSInteger column = 6;
    NSInteger pieceSize = (SCREEN_WIDTH - 30-5*9)/column;
    CGFloat pieceX = 0;
    CGFloat pieceY = 0;
    NSInteger wrap = 0;
    NSArray * timeArray = @[@"7:00",@"7:30",@"8:00",@"8:30",@"9:00",@"9:30",@"10:00",@"10:30",@"11:00",@"11:30",@"12:00",@"12:30",@"13:00",@"13:30",@"14:00",@"14:30",@"15:00",@"15:30",@"16:00",@"16:30",@"17:00",@"17:30",@"18:00",@"18:30"];
    for (NSUInteger i = 0; i < timeArray.count; i++) {
        wrap = i%column;
        pieceX = 15 + (pieceSize + 9)*wrap;
        pieceY = (25 + 25 + 16) + i/column * (pieceSize * 0.5 + 7);
        UIButton * timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:timeBtn];
        timeBtn.backgroundColor = [UIColor sc_colorWithf8f8f8];
        timeBtn.layer.masksToBounds = YES;
        [timeBtn.layer setCornerRadius:4.0];
        [timeBtn setTitleColor:[UIColor sc_colorWithCCCCCC] forState:UIControlStateNormal];
        timeBtn.frame = CGRectMake(pieceX, pieceY, pieceSize, 0.5*pieceSize);
        [timeBtn addTarget:self action:@selector(timeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [timeBtn setTitle:[timeArray safeObjectAtIndex:i] forState:UIControlStateNormal];
        timeBtn.titleLabel.font = [UIFont sy_font12];
    }

    CGFloat timeHeight = 4 * pieceSize * 0.5 + 7*3 + 65 + 25;
    UIImageView * serviceImageView = [[UIImageView alloc] init];
    [self.view addSubview:serviceImageView];
    [serviceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.top.equalTo(self.view.mas_top).with.offset(timeHeight);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];

    UILabel * choiseServiceContentLabel = [[UILabel alloc] init];
    [self.view addSubview:choiseServiceContentLabel];
    choiseServiceContentLabel.text = @"请选择服务内容";
    choiseServiceContentLabel.font = [UIFont sy_boldFont16];
    choiseServiceContentLabel.textColor = [UIColor sc_colorWith444444];
    [choiseServiceContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(serviceImageView.mas_right).with.offset(6);
        make.top.equalTo(serviceImageView.mas_top).with.offset(0);
    }];
    
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-44);
        make.top.equalTo(choiseServiceContentLabel.mas_bottom).with.offset(20);
    }];
    
    UIView * bottomView = [[UIView alloc] init];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(45);
    }];
    bottomView.backgroundColor = [UIColor sc_colorWith6C6DFD];
    
    UILabel * numberOfServiceLabel = [[UILabel alloc] init];
    [bottomView addSubview:numberOfServiceLabel];
    numberOfServiceLabel.textColor = [UIColor whiteColor];
    [numberOfServiceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottomView.mas_left).with.offset(20);
        make.centerY.mas_equalTo(bottomView.mas_centerY);
    }];
    numberOfServiceLabel.text = [NSString stringWithFormat:@"共%zd项，总计¥%@",2,@"1167"];
    
    UILabel * makeAnAppointmentLabel = [[UILabel alloc] init];
    [bottomView addSubview:makeAnAppointmentLabel];
    makeAnAppointmentLabel.text = @"我的预约";
    makeAnAppointmentLabel.textColor = [UIColor whiteColor];
    [makeAnAppointmentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bottomView.mas_centerY);
        make.right.equalTo(bottomView.mas_right).with.offset(-33);
    }];
    
    UIButton * makeAnAppointmentBtn = [[UIButton alloc] init];
    [bottomView addSubview:makeAnAppointmentBtn];
    [makeAnAppointmentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bottomView.mas_centerY);
        make.right.equalTo(bottomView.mas_right).with.offset(-0);
        make.top.equalTo(bottomView.mas_top).with.offset(0);
        make.bottom.equalTo(bottomView.mas_bottom).with.offset(-0);
        make.width.mas_equalTo(44);
    }];
    makeAnAppointmentBtn.backgroundColor = [UIColor clearColor];
    [makeAnAppointmentBtn addTarget:self action:@selector(makeAnAppointmentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView * segmentView = [[UIView alloc] init];
    [bottomView addSubview:segmentView];
    segmentView.backgroundColor = [UIColor blackColor];
    [segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(makeAnAppointmentLabel.mas_left).with.offset(-35);
        make.centerY.mas_equalTo(bottomView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(0.5, 20));
    }];
    
}


#pragma mark todayBtnClick
- (void)todayBtnClick:(UIButton *)sender
{
    
}

- (void)tomorrowBtnClick:(UIButton *)sender
{
    
}

- (void)timeBtnClick:(UIButton *)sender
{
    
}

- (void)makeAnAppointmentBtnClick:(UIButton *)sender
{
    
}


#pragma mark Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.dataArray.count;
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCMyAppointmentViewCell * cell = [SCMyAppointmentViewCell myAppointmentViewCellWithTabeleView:tableView];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [SCMyAppointmentViewCell cellHeight];
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
