//
//  SCMakeAnAppointmentprocessController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/24.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMakeAnAppointmentprocessController.h"
#import "SCMakeAnAppointmentprocessCell.h"
@interface SCMakeAnAppointmentprocessController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;
@end

@implementation SCMakeAnAppointmentprocessController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"保险钣金"];
    [self setupView];
}

- (void)setupView
{
    UIView * topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor cdf_colorWithHexString:@"FED832" alpha:0.17];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    
    UIImageView * phoneImageView = [[UIImageView alloc] init];
    [phoneImageView setImage:[UIImage imageNamed:@"bjpq_ico_phone"]];
    [topView addSubview:phoneImageView];
    [phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(16, 16));
        make.centerY.mas_equalTo(topView.mas_centerY);
    }];
    
    UILabel * phoneNumberLabel = [[UILabel alloc] init];
    [topView addSubview:phoneNumberLabel];
    phoneNumberLabel.font = [UIFont sy_font14];
    phoneNumberLabel.textColor = [UIColor sc_colorWithFC8739];
#warning 写死
    phoneNumberLabel.text = @"15395179056";
    [phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneImageView.mas_right).with.offset(0);
        make.top.equalTo(phoneImageView.mas_top).with.offset(0);
        make.bottom.equalTo(phoneImageView.mas_bottom).with.offset(-0);
    }];
    
    
    UILabel * settleClaimsAssistantDirectorLabel = [[UILabel alloc] init];
    [topView addSubview:settleClaimsAssistantDirectorLabel];
    settleClaimsAssistantDirectorLabel.textColor = [UIColor sc_colorWith444444];
    settleClaimsAssistantDirectorLabel.text = [NSString stringWithFormat:@"理赔专员：%@",@"曹经理"];
    [settleClaimsAssistantDirectorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneNumberLabel.mas_right).with.offset(20);
        make.top.equalTo(phoneNumberLabel.mas_top).with.offset(0);
        make.bottom.equalTo(phoneNumberLabel.mas_bottom).with.offset(-0);
    }];
    
    
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-44);
    }];
    tableView.tableHeaderView = topView;
    
    UIButton * makeAppointmentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:makeAppointmentBtn];
    [makeAppointmentBtn setTitle:@"我要预约" forState:UIControlStateNormal];
    [makeAppointmentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    makeAppointmentBtn.backgroundColor = [UIColor sc_colorWith6C6DFD];
    makeAppointmentBtn.titleLabel.font = [UIFont sy_boldFont16];
    [makeAppointmentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(44);
    }];
    [makeAppointmentBtn addTarget:self action:@selector(makeAppointmentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCMakeAnAppointmentprocessCell * cell = [SCMakeAnAppointmentprocessCell makeAnAppointmentprocessCellWithTabeleView:tableView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [SCMakeAnAppointmentprocessCell cellHeight];
}

#pragma mark
- (void)makeAppointmentBtnClick:(UIButton *)sender
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
