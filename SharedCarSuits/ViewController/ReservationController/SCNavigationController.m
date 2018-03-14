//
//  SCNavigationController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCNavigationController.h"
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件
#import "SCReservationViewCell.h"
@interface SCNavigationController ()<BMKMapViewDelegate>
@property (nonatomic, weak) BMKMapView* mapView;
@end

@implementation SCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"门店详情"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self sy_leftBarButtonItem];
    UIButton * shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIBarButtonItem * rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
    [shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self setupView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.mapView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.mapView.delegate = nil;
}

- (void)shareBtnClick:(UIButton *)sender
{
    
}

- (void)setupView
{
//    BMKMapView * mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1.04*SCREEN_WIDTH)];
//    mapView.backgroundColor = [UIColor whiteColor];
//    self.mapView = mapView;
//    [self.view addSubview:mapView];
    
    BMKMapView * mapView = [[BMKMapView alloc] init];
    [self.view addSubview:mapView];
   
    
    SCReservationViewCell * cellView = [[SCReservationViewCell alloc] init];
    cellView.shopModel = _listModel;
    cellView.selectionStyle = UITableViewCellSelectionStyleNone;
    cellView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cellView];
    [cellView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(230);
    }];
    
    
    [mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.bottom.equalTo(cellView.mas_top).with.offset(-0);
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
