//
//  SCReceiveCouponsViewConroller.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/22.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCReceiveCouponsViewConroller.h"
#import "SCReceiveTableViewCell.h"
#import "SCManager+RequestInterface.h"
#import "SCManager+CommonMethods.h"
#import "SCCouponModel.h"
@interface SCReceiveCouponsViewConroller ()<UITableViewDelegate,UITableViewDataSource,SCReceiveTableViewCellDelegate>
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, assign) NSInteger page;
@end

@implementation SCReceiveCouponsViewConroller

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"领取优惠券"];
    [self setupView];
    [self sy_leftBarButtonItem];
    [self loadNewData];
}

- (void)loadNewData
{
    self.page = 1;
    [self loadDataWithPage:1];
}

- (void)loadMoreData
{
    self.page += 1;
    [self loadDataWithPage:self.page];
}

- (void)loadDataWithPage:(NSInteger)page
{
    NSString * length = [NSString stringWithFormat:@"%zd",10*page];
    
    SCCouponModel * model = [self.dataArray lastObject];
    NSString * couponsiD;
    if (model.cpuponId > 0)
    {
        couponsiD = [NSString stringWithFormat:@"%zd",model.cpuponId];
    }else
    {
        couponsiD = @"0";
    }
    WEAKSELF
    [[SCManager shareInstance] couponReceiveListWithLastCouponId:couponsiD length:length success:^(NSURLSessionDataTask *serializer, id responseObject) {
        STRONGSELF
        
        NSInteger ifHave = [[responseObject objectForKey:@"ifHave"] integerValue];
        if (ifHave == 1){
            strongSelf.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        }else{
            strongSelf.tableView.mj_footer = nil;
        }
        if (page == 1){
            [strongSelf.dataArray removeAllObjects];
            [strongSelf.tableView.mj_header endRefreshing];
        }else{
            [strongSelf.tableView.mj_footer endRefreshing];
        }
        NSArray * list = [responseObject objectForKey:@"list"];
        strongSelf.dataArray = [[NSArray yy_modelArrayWithClass:[SCCouponModel class] json:list] mutableCopy];
        [strongSelf.tableView reloadData];
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        
    }];
}


- (void)setupView
{
    UIView * bottomView = [[UIView alloc] init];
    [self.view addSubview:bottomView];
    bottomView.backgroundColor = [UIColor sc_colorWith6C6DFD];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
    
    UIImageView * headerImageView = [[UIImageView alloc] init];
    [self.view addSubview:headerImageView];
    headerImageView.clipsToBounds = YES;
    [headerImageView setImage:[UIImage imageNamed:@"coupon_bg_header"]];
    headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    CGFloat height = SCREEN_WIDTH*471/750;
    [headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight);
        make.height.mas_equalTo(height);
    }];
    
    UILabel * receiveCouponsLabel = [[UILabel alloc] init];
    [self.view addSubview:receiveCouponsLabel];
    receiveCouponsLabel.text = @"今日还可以领取";
    receiveCouponsLabel.textColor = [UIColor whiteColor];
    receiveCouponsLabel.textAlignment = NSTextAlignmentCenter;
    [receiveCouponsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(headerImageView.mas_bottom).with.offset(0);
    }];
    
    UIImageView * leftImageView = [[UIImageView alloc] init];
    [self.view addSubview:leftImageView];
    [leftImageView setImage:[UIImage imageNamed:@"coupon_tilte_dict_left"]];
    [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(8.5, 9));
        make.top.equalTo(headerImageView.mas_bottom).with.offset(5);
        make.right.equalTo(self.view.mas_centerX).with.offset(-65);
    }];
    
    UIImageView * rightImageView = [[UIImageView alloc] init];
    [self.view addSubview:rightImageView];
    [rightImageView setImage:[UIImage imageNamed:@"coupon_tilte_dict_right"]];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(8.5, 9));
        make.top.equalTo(headerImageView.mas_bottom).with.offset(5);
        make.left.equalTo(self.view.mas_centerX).with.offset(65);
    }];
    
    
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.backgroundColor = [UIColor sc_colorWith6C6DFD];
    tableView.delegate = self;
    self.tableView = tableView;
    tableView.dataSource = self;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.right.equalTo(self.view.mas_right).with.offset(-15);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.top.equalTo(receiveCouponsLabel.mas_bottom).with.offset(20);
    }];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.mj_header = [SCDIYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCCouponModel * model = [self.dataArray safeObjectAtIndex:indexPath.row];
    SCReceiveTableViewCell * cell = [SCReceiveTableViewCell receiveTableViewCellWithTableView:tableView andObj:model];
    cell.backgroundColor = [UIColor sc_colorWith6C6DFD];
    cell.couponType = SCCouponTypeWithReceive;
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [SCReceiveTableViewCell cellHeight];
}

#pragma mark receiveCouponWithCouponDelegate
- (void)receiveCouponWithCouponModel:(SCCouponModel *)model
{
    NSString * couponId = [NSString stringWithFormat:@"%zd",model.cpuponId];
    [[SCManager shareInstance] couponReceiveWithCouponId:couponId success:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        
    }];
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
