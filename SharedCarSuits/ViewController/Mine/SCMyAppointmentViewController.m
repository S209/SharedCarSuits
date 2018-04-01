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
#import "SCOrderConfirmationViewController.h"
#import "SCManager+RequestInterface.h"
#import "SCAppointmentModel.h"
#import "SCAppointmentServiceModel.h"
#import "SCOrderInfoModel.h"
#import <NSDate+MTDates.h>
#import "SCManager+CommonMethods.h"
#import "SCManager+MBProgressHUD.h"
#import "SCOrderListModel.h"
@interface SCMyAppointmentViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) NSMutableArray * timeArray;
@property (nonatomic, assign) NSInteger lastNumberOfTimeItemArrayCount;
@property (nonatomic, assign) NSInteger timeType;//0 今 1 明
@property (nonatomic, weak) UILabel * choiseServiceContentLabel;
@property (nonatomic, weak) UIView * bottomView;
@property (nonatomic, weak) UIImageView * serviceImageView;
@property (nonatomic, weak) UIButton * todayBtn;
@property (nonatomic, weak) UIButton * tomorrowBtn;
@property (nonatomic, strong) NSMutableArray * selectServiceArray;
@property (nonatomic, weak) UILabel * numberOfServiceLabel;
@property (nonatomic, copy) NSString * reservationTimeString;
@property (nonatomic, assign) NSInteger lastBtnTag;
@end

@implementation SCMyAppointmentViewController
- (NSMutableArray *)selectServiceArray
{
    if (!_selectServiceArray) {
        _selectServiceArray = [NSMutableArray array];
    }
    return _selectServiceArray;
}

- (void)setTimeArray:(NSMutableArray *)timeArray
{
    _timeArray = timeArray;
    for (NSUInteger i = 0; i < self.lastNumberOfTimeItemArrayCount; i++) {
        UIButton * timeBtn = (UIButton *)[self.view viewWithTag:300+i];
        [timeBtn removeFromSuperview];
    }
    self.lastNumberOfTimeItemArrayCount  = timeArray.count;
    NSInteger column = 6;
    NSInteger pieceSize = (SCREEN_WIDTH - 30-5*9)/column;
    CGFloat pieceX = 0;
    CGFloat pieceY = 0;
    NSInteger wrap = 0;
    for (NSUInteger i = 0; i < timeArray.count; i++) {
        wrap = i%column;
        pieceX = 15 + (pieceSize + 9)*wrap;
        pieceY = (25 + 25 + 16) + i/column * (pieceSize * 0.5 + 7);
        UIButton * timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:timeBtn];
        timeBtn.tag = 300+i;
        timeBtn.backgroundColor = [UIColor sc_colorWithf8f8f8];
        timeBtn.layer.masksToBounds = YES;
        [timeBtn.layer setCornerRadius:4.0];
        
        timeBtn.frame = CGRectMake(pieceX, pieceY, pieceSize, 0.5*pieceSize);
        [timeBtn addTarget:self action:@selector(timeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        SCAppointmentModel * mentModel = [timeArray safeObjectAtIndex:i];
        [timeBtn setTitle:mentModel.time forState:UIControlStateNormal];
        BOOL flag = [self hasCanClickWithTime:mentModel.time];
        if (flag){
             timeBtn.enabled = YES;
            [timeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }else{
            timeBtn.enabled = NO;
            [timeBtn setTitleColor:[UIColor sc_colorWithCCCCCC] forState:UIControlStateNormal];
        }
        timeBtn.titleLabel.font = [UIFont sy_font12];
    }
    
    CGFloat timeHeight = 4 * pieceSize * 0.5 + 7*3 + 65 + 25;
    [self.serviceImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.top.equalTo(self.view.mas_top).with.offset(timeHeight);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [self.choiseServiceContentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.serviceImageView.mas_right).with.offset(6);
        make.centerY.mas_equalTo(self.serviceImageView.mas_centerY);
    }];
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-44);
        make.top.equalTo(self.choiseServiceContentLabel.mas_bottom).with.offset(20);
    }];
    [self.view updateConstraintsIfNeeded];
}


- (BOOL)hasCanClickWithTime:(NSString *)selectTime{
    if (self.timeType == 1) {
        return YES;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale currentLocale];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    //2018-02-26+8:00:00
    NSString * time = [NSString stringWithFormat:@"%@ %@:00",currentDateStr,selectTime];
    NSDate * appointmentDate = [NSDate mt_dateFromString:time usingFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSTimeZone * zone = [NSTimeZone systemTimeZone];
    NSInteger appointmentInterval = [zone secondsFromGMTForDate:appointmentDate];
    NSDate * localeAppointmentDate = [appointmentDate  dateByAddingTimeInterval: appointmentInterval];
    
    

    
    NSDate * date = [NSDate date];
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate * localeDate = [date  dateByAddingTimeInterval: interval];
    
    NSComparisonResult result = [localeDate compare:localeAppointmentDate];

    if (result == -1){
        return YES;
    }
    return NO;
}

- (NSMutableArray *)dataArray 
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.lastBtnTag = -99;
    [self setNavigationWithTitle:@"预约流程"];
    [self sy_leftBarButtonItem];
    [self setupView];
    [self loadNewDataWithTime];
    self.timeType = 0;
    [self loadSerVice];
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
    self.tomorrowBtn = tomorrowBtn;
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
    self.todayBtn = todayBtn;
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
    for (NSUInteger i = 0; i < self.timeArray.count; i++) {
        wrap = i%column;
        pieceX = 15 + (pieceSize + 9)*wrap;
        pieceY = (25 + 25 + 16) + i/column * (pieceSize * 0.5 + 7);
        UIButton * timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:timeBtn];
        timeBtn.tag = 300+i;
        timeBtn.backgroundColor = [UIColor sc_colorWithf8f8f8];
        timeBtn.layer.masksToBounds = YES;
        [timeBtn.layer setCornerRadius:4.0];
        [timeBtn setTitleColor:[UIColor sc_colorWithCCCCCC] forState:UIControlStateNormal];
        timeBtn.frame = CGRectMake(pieceX, pieceY, pieceSize, 0.5*pieceSize);
        [timeBtn addTarget:self action:@selector(timeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        timeBtn.titleLabel.font = [UIFont sy_font12];
        BOOL flag = [self hasCanClickWithTime:[self.timeArray safeObjectAtIndex:i]];
        if (flag){
            [timeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }else{
            [timeBtn setTitleColor:[UIColor sc_colorWithCCCCCC] forState:UIControlStateNormal];
        }
    }

    CGFloat timeHeight = 4 * pieceSize * 0.5 + 7*3 + 65 + 25;
    UIImageView * serviceImageView = [[UIImageView alloc] init];
    [self.view addSubview:serviceImageView];
    self.serviceImageView = serviceImageView;
    [serviceImageView setImage:[UIImage imageNamed:@"coupon_type_icon_content"]];
    [serviceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.top.equalTo(self.view.mas_top).with.offset(timeHeight);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];

    UILabel * choiseServiceContentLabel = [[UILabel alloc] init];
    self.choiseServiceContentLabel = choiseServiceContentLabel;
    [self.view addSubview:choiseServiceContentLabel];
    choiseServiceContentLabel.text = @"请选择服务内容";
    choiseServiceContentLabel.font = [UIFont sy_boldFont16];
    choiseServiceContentLabel.textColor = [UIColor sc_colorWith444444];
    [choiseServiceContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(serviceImageView.mas_right).with.offset(6);
        make.centerY.mas_equalTo(serviceImageView.mas_centerY);
    }];
    
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.showsVerticalScrollIndicator = NO;
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
    self.bottomView = bottomView;
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(45);
    }];
    bottomView.backgroundColor = [UIColor sc_colorWith6C6DFD];
    
    UILabel * numberOfServiceLabel = [[UILabel alloc] init];
    [bottomView addSubview:numberOfServiceLabel];
    self.numberOfServiceLabel = numberOfServiceLabel;
    numberOfServiceLabel.textColor = [UIColor whiteColor];
    [numberOfServiceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottomView.mas_left).with.offset(20);
        make.centerY.mas_equalTo(bottomView.mas_centerY);
    }];
    
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
        make.right.equalTo(bottomView.mas_right).with.offset(-0);
        make.top.equalTo(bottomView.mas_top).with.offset(0);
        make.bottom.equalTo(bottomView.mas_bottom).with.offset(-0);
        make.width.mas_equalTo(150);
    }];
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


#pragma mark
- (void)loadNewDataWithTime
{
    //    dispatch_group_t group = dispatch_group_create();
    //    dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
    // 并行执行的线程一
    [[SCManager shareInstance] appointmentOrderTodayOrTodayListWithShopId:@"1" orderType:[NSString stringWithFormat:@"%zd",_serviceType] carId:@"0" timeType:[NSString stringWithFormat:@"%zd",self.timeType] success:^(NSURLSessionDataTask *serializer, id responseObject) {
        NSArray * responseArray = [NSArray yy_modelArrayWithClass:[SCAppointmentModel class] json:responseObject];
        self.timeArray = [responseArray mutableCopy];
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        
    }];
    //    });
    
    //    dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
    // 并行执行的线程二 SCUrl_AppointmentOrderTime
    
    //    });
    //    dispatch_group_notify(group, dispatch_get_global_queue(0,0), ^{
    //        // 汇总结果
    //        [self.tableView reloadData];
    //    });
}


- (void)loadSerVice
{
    [[SCManager shareInstance] appointmentOrderWithShopId:@"1" orderType:[NSString stringWithFormat:@"%zd",_serviceType] carId:@"0" success:^(NSURLSessionDataTask *serializer, id responseObject) {
        NSLog(@"===%@===",responseObject);
        NSDictionary * projectDict =  [responseObject safeObjectAtIndex:0];
        NSArray * projectArray = [projectDict objectForKey:@"project"];
        NSArray * dataArray = [NSArray yy_modelArrayWithClass:[SCAppointmentServiceModel class] json:projectArray];
        
        self.dataArray = [dataArray mutableCopy];
        [self.tableView reloadData];
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        
    }];
}



#pragma mark todayBtnClick
- (void)todayBtnClick:(UIButton *)sender
{
    [self.tomorrowBtn setTitleColor:[UIColor cdf_colorWithHexString:@"999999" alpha:0.99] forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor sc_colorWithFC8739] forState:UIControlStateNormal];
     self.timeType = 0;
    [self loadNewDataWithTime];
}

- (void)tomorrowBtnClick:(UIButton *)sender
{
    [sender setTitleColor:[UIColor sc_colorWithFC8739] forState:UIControlStateNormal];
    [self.todayBtn setTitleColor:[UIColor cdf_colorWithHexString:@"999999" alpha:0.99] forState:UIControlStateNormal];
    self.timeType = 1;
    [self loadNewDataWithTime];
}

- (void)timeBtnClick:(UIButton *)sender
{
    if (sender.enabled) {
         NSInteger tag = sender.tag - 300;
        if (self.lastBtnTag != tag && self.lastBtnTag >= 0)
        {
            UIButton * lastBtn = (UIButton *)[self.view viewWithTag:self.lastBtnTag+300];
            [lastBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            lastBtn.backgroundColor = [UIColor sc_colorWithf8f8f8];
        }

        self.lastBtnTag = tag;
        SCAppointmentModel * mentModel = [self.timeArray safeObjectAtIndex:tag];
        self.reservationTimeString = [NSString stringWithFormat:@"%@:00",mentModel.time];
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        sender.backgroundColor = [UIColor sc_colorWith6C6DFD];
    }
}

- (void)makeAnAppointmentBtnClick:(UIButton *)sender
{

    if (self.reservationTimeString.length) {
        NSMutableString * projectString = [NSMutableString string];
        for (NSUInteger i = 0; i < self.selectServiceArray.count; i++) {
            SCAppointmentServiceModel * model = [self.selectServiceArray safeObjectAtIndex:i];
            [projectString appendString:[NSString stringWithFormat:@"%zd",model.idDes]];
            if (i < self.selectServiceArray.count-1) {
                [projectString appendString:@";"];
            }
        }
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [NSLocale currentLocale];
        //设定时间格式,这里可以设置成自己需要的格式
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        //用[NSDate date]可以获取系统当前时间
        NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
        //2018-02-26+8:00:00
        NSString * time = [NSString stringWithFormat:@"%@+%@",currentDateStr,self.reservationTimeString];
#warning 店的ID 写死
        [[SCManager shareInstance] makeAnAppointmentWithShopId:@"1" orderType:[NSString stringWithFormat:@"%zd",_serviceType] projectIds:projectString carId:@"0" date:time success:^(NSURLSessionDataTask *serializer, id responseObject) {
            SCOrderInfoModel * infoModel = [SCOrderInfoModel yy_modelWithDictionary:responseObject];
            
            SCOrderListModel * listModel = [[SCOrderListModel alloc] init];
            listModel.orderType = _serviceType;
           
            
            SCOrderConfirmationViewController * orderConfirmation = [[SCOrderConfirmationViewController alloc] init];
            orderConfirmation.infoModel = infoModel;
            
            orderConfirmation.orderType = _serviceType;
            [self.navigationController pushViewController:orderConfirmation animated:YES];
            
        } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
            
        } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
            
        }];
    }else{
        [SCManager dismissInfo:@"不在预约时间的范围内"];
    }
}


#pragma mark Delegate
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
    SCMyAppointmentViewCell * cell = [SCMyAppointmentViewCell myAppointmentViewCellWithTabeleView:tableView];
    cell.serviceModel = [self.dataArray safeObjectAtIndex:indexPath.row];
    WEAKSELF
    cell.deleteBlock = ^(SCAppointmentServiceModel * serviceModel){
        STRONGSELF
        if (strongSelf) {
            [strongSelf.selectServiceArray removeObject:serviceModel];
             [strongSelf updateServiceInfo];
        }
    };
    
    cell.selectedBlock = ^(SCAppointmentServiceModel *serviceModel) {
        STRONGSELF
        if (strongSelf) {
            [strongSelf.selectServiceArray addObject:serviceModel];
            [strongSelf updateServiceInfo];
        }
    };
    
    return cell;
}

- (void)updateServiceInfo
{
    CGFloat price = 0;
    for (SCAppointmentServiceModel * model in self.selectServiceArray) {
       price += [model.price floatValue];
    }
    self.numberOfServiceLabel.text = [NSString stringWithFormat:@"共%zd项，总计¥%.2f",self.selectServiceArray.count,price];
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
