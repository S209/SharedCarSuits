//
//  SCNavigationController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//
#import "SCNavigationDetailsPageView.h"
#import "SCNavigationController.h"
#import "SCReservationViewCell.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MapKit/MapKit.h>
#define kGaoDeMapPathHost @"iosamap://path"
#define kBaiDuMapPathHost @"baidumap://map/direction"
#define kAppleMapPathHost @"apple_map"
@interface SCNavigationController ()<MAMapViewDelegate,SCReservationViewCellDelegate>
@property (nonatomic, strong) MAPointAnnotation *startAnnotation;
@property (nonatomic, strong) MAPointAnnotation *destinationAnnotation;
@property (nonatomic, strong) MAAnnotationView *userLocationAnnotationView;

/* 起始点经纬度. */
@property (nonatomic) CLLocationCoordinate2D startCoordinate;
/* 终点经纬度. */
@property (nonatomic) CLLocationCoordinate2D destinationCoordinate;

@property (nonatomic, weak) MAMapView * mapView;
@end

@implementation SCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"门店详情"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self sy_leftBarButtonItem];
//    UIButton * shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIBarButtonItem * rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
//    self.navigationItem.rightBarButtonItem = rightBtnItem;
//    [shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
 
    [self initWithMap];
    [self setupView];
}

- (void)initWithMap
{
    [AMapServices sharedServices].enableHTTPS = YES;
    ///初始化地图
    MAMapView * mapView = [[MAMapView alloc] init];
    self.mapView = mapView;
    mapView.showsCompass= NO;
    mapView.showsScale= NO;
    mapView.showsUserLocation = YES;
    mapView.delegate = self;
    [self.mapView setZoomLevel:13 animated:YES];
    mapView.userTrackingMode = MAUserTrackingModeFollow;
    ///把地图添加至view
    [self.view addSubview:mapView];
    [mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-230);
        make.top.equalTo(self.view.mas_top).with.offset(0);
    }];
}


- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        if (self.startAnnotation == annotation) {
            /* 起点. */
            MAAnnotationView *poiAnnotationView = (MAAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"startPoint"];
            if (poiAnnotationView == nil)
            {
                poiAnnotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation
                                                                 reuseIdentifier:@"startPoint"];
            }
            poiAnnotationView.canShowCallout = NO;
            poiAnnotationView.image = nil;
            poiAnnotationView.image = [UIImage imageNamed:@"map_start_position"];
            
            return poiAnnotationView;
        }
//        else if(self.destinationAnnotation == annotation) {
//            /* 终点. */
//            SYMapAnnotationView *annotationView = (SYMapAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"endPoint"];
//            if (annotationView == nil)
//            {
//                annotationView = [[SYMapAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"endPoint"];
//                WEAKSELF
//                annotationView.mapNavigation = ^{
//                    [weakSelf loadRequestH5FromActionValue:@"homepage.navigation.list"];
//                    [weakSelf event:@"map_location:guidance"];
//                    [weakSelf showNaviOptionWithSelectedMapScheme:[SYUserDefaults standardUserDefaults].selectedMapScheme];
//                };
//                annotationView.canShowCallout = NO;
//                annotationView.draggable = YES;
//                annotationView.entity = self.mapInfo;
//            }
//
//            return annotationView;
//        }
    }
    
    return nil;
}

- (void)setupView
{
    SCNavigationDetailsPageView * cellView = [[SCNavigationDetailsPageView alloc] init];
    cellView.shopModel = _listModel;
    cellView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cellView];
    cellView.delegate = self;
    [cellView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(230);
    }];
}


//导航
/*

 */
- (void)reservationViewCellNavigationWithModel:(SCShopListModel *)listModel
{
    if (YES) {
        //苹果公司的地图
        MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
        MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:self.destinationCoordinate addressDictionary:nil]];
        
        
        [MKMapItem openMapsWithItems:@[currentLocation, toLocation]
                       launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,
                                       MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
    } else {
        //高德、百度
//        NSMutableString *urlM = [NSMutableString stringWithString:url];
//        NSMutableString *paramStr = [NSMutableString stringWithString:@"?"];
//        [param enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//            [paramStr appendString:[NSString stringWithFormat:@"%@=%@&", key, obj]];
//        }];
//        paramStr = (NSMutableString *)[paramStr substringToIndex:(paramStr.length-1)];
//        [urlM appendString:paramStr];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[urlM stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    }
}

- (NSDictionary *)getMapParamWithScheme:(NSString *)scheme
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if ([scheme isEqualToString:kGaoDeMapPathHost]) {
        [param setValue:@"BGVIS1" forKey:@"sid"];
        [param setValue:@(self.startCoordinate.latitude) forKey:@"slat"];
        [param setValue:@(self.startCoordinate.longitude) forKey:@"slon"];
        [param setValue:@"BGVIS2" forKey:@"did"];
        [param setValue:@(self.destinationCoordinate.latitude) forKey:@"dlat"];
        [param setValue:@(self.destinationCoordinate.longitude) forKey:@"dlon"];
//        [param setValue:self.mapInfo.title forKey:@"dname"];
        [param setValue:@"0" forKey:@"t"];
        [param setValue:@"Soyoung" forKey:@"sourceApplication"];
        [param setValue:@"app.soyoung://" forKey:@"backScheme"];
    } else if (([scheme isEqualToString:kBaiDuMapPathHost])) {
//        NSString *origin = [NSString stringWithFormat:@"latlng:%f,%f|name:%@", self.startCoordinate.latitude, self.startCoordinate.longitude, @"我的位置"];
//        [param setValue:origin forKey:@"origin"];
//        NSString *destination = [NSString stringWithFormat:@"latlng:%f,%f|name:%@", self.destinationCoordinate.latitude, self.destinationCoordinate.longitude, self.mapInfo.title];
//        [param setValue:destination forKey:@"destination"];
//        [param setValue:@"driving" forKey:@"mode"];
//        [param setValue:@"gcj02" forKey:@"coord_type"];
//        [param setValue:@"app.soyoung://" forKey:@"src"];
    }else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"qqmap://"]]) {
//        NSMutableDictionary *param = [NSMutableDictionary dictionary];
        param[@"title"] = @"腾讯地图";
        NSString *urlString = [[NSString stringWithFormat:@"qqmap://map/routeplan?from=我的位置&type=drive&tocoord=%f,%f&to=终点&coord_type=1&policy=0",self.destinationCoordinate.latitude, self.destinationCoordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        param[@"url"] = urlString;
//        [maps addObject:qqMapDic];
    }
    return param.copy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
