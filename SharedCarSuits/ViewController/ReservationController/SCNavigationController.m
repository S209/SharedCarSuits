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
#import "SCStoreDetailsAlertView.h"
#import "SCShopListModel.h"
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
    NSArray * locArray = [self.listModel.location componentsSeparatedByString:@";"];
    
    NSLog(@"===%lf===",[[locArray safeObjectAtIndex:0] floatValue]);
    NSLog(@"===%lf===",[[locArray safeObjectAtIndex:1] floatValue]);
    
    CLLocationCoordinate2D  destinationCoordinate = CLLocationCoordinate2DMake([[locArray safeObjectAtIndex:0] floatValue], [[locArray safeObjectAtIndex:1] floatValue]);
    self.destinationCoordinate = destinationCoordinate;
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
 #define kGaoDeMapPathHost @"iosamap://path"
 #define kBaiDuMapPathHost @"baidumap://map/direction"
 #define kQQMaoPathHost @"qqmap://"
 #define kAppleMapPathHost @"apple_map"
 
 [self.mapArray addObject:@"用iPhone自带地图导航"];
 [self.mapArray addObject:@"用百度地图导航"];
 [self.mapArray addObject:@"用高德地图导航"];
 [self.mapArray addObject:@"用腾讯地图导航"];
 }
 */
- (void)reservationViewCellNavigationWithModel:(SCShopListModel *)listModel
{
    SCStoreDetailsAlertView *  alertView = [[SCStoreDetailsAlertView alloc]init];
    [alertView showWithMapClick:^(NSString *mapPathHost) {
        [self handleDataWithMapPathHost:mapPathHost];
    }];
}

- (void)handleDataWithMapPathHost:(NSString *)mapPathHost
{
    NSDictionary * params = [[NSDictionary alloc] init];
    NSString * mapHost = nil;
    if ([mapPathHost containsString:@"高德"]) {
        params = [self getInstalledMapAppWithEndLocation:self.destinationCoordinate  scheme:kGaoDeMapPathHost];
        mapHost = kGaoDeMapPathHost;
    }else if ([mapPathHost containsString:@"百度"]){
        params = [self getInstalledMapAppWithEndLocation:self.destinationCoordinate  scheme:kBaiDuMapPathHost];
        mapHost = kBaiDuMapPathHost;
    }else if ([mapPathHost containsString:@"腾讯"]){
        params = [self getInstalledMapAppWithEndLocation:self.destinationCoordinate  scheme:kQQMaoPathHost];
        mapHost = kQQMaoPathHost;
    }else if ([mapPathHost containsString:@"iPhone自带地图"]){
        params = [self getInstalledMapAppWithEndLocation:self.destinationCoordinate  scheme:kGaoDeMapPathHost];
        mapHost = kAppleMapPathHost;
    }
    [self jumpMapWithMapHost:mapHost dict:params];
}

- (void)jumpMapWithMapHost:(NSString *)mapPathHost dict:(NSDictionary *)param
{
    if ([mapPathHost isEqualToString:kAppleMapPathHost]) {
        //苹果公司的地图
        MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
        MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:self.destinationCoordinate addressDictionary:nil]];
        
        
        [MKMapItem openMapsWithItems:@[currentLocation, toLocation]
                       launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,
                                       MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
    } else {
        //高德、百度、qq
        NSMutableString *urlM = [NSMutableString stringWithString:mapPathHost];
        NSMutableString *paramStr = [NSMutableString stringWithString:@"?"];
        [param enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [paramStr appendString:[NSString stringWithFormat:@"%@=%@&", key, obj]];
        }];
        paramStr = (NSMutableString *)[paramStr substringToIndex:(paramStr.length-1)];
        [urlM appendString:paramStr];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[urlM stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    }
}




- (NSDictionary *)getInstalledMapAppWithEndLocation:(CLLocationCoordinate2D)endLocation scheme:(NSString *)scheme
{
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    //    NSMutableArray *maps = [NSMutableArray array];
    
    //苹果地图
    //    NSMutableDictionary *iosMapDic = [NSMutableDictionary dictionary];
    //    iosMapDic[@"title"] = @"苹果地图";
    //    [maps addObject:iosMapDic];
    
    //百度地图
    if ([scheme isEqualToString:kBaiDuMapPathHost]){
        NSMutableDictionary *baiduMapDic = [NSMutableDictionary dictionary];
        baiduMapDic[@"title"] = @"百度地图";
        NSString *urlString = [[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%f,%f|name=目的地&mode=walking&coord_type=gcj02",endLocation.latitude,endLocation.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        baiduMapDic[@"url"] = urlString;
        if (self.listModel.descriptionString.length) {
            [baiduMapDic setValue:self.listModel.descriptionString forKey:@"dname"];
        }
        return baiduMapDic;
    }
#warning 这个地方有问题 数据写死
    //高德地图
    if ([scheme isEqualToString:kGaoDeMapPathHost])  {
        NSMutableDictionary *gaodeMapDic = [NSMutableDictionary dictionary];
        gaodeMapDic[@"title"] = @"高德地图";
        NSString *urlString = [[NSString stringWithFormat:@"iosamap://navi?sourceApplication=%@&backScheme=%@&lat=%f&lon=%f&dev=0&style=2",@"共享车服",@"app.soyoung://",endLocation.latitude,endLocation.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        gaodeMapDic[@"url"] = urlString;
        if (self.listModel.descriptionString.length) {
            [gaodeMapDic setValue:self.listModel.descriptionString forKey:@"dname"];
        }
        return gaodeMapDic;
    }
    
    //腾讯地图
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"qqmap://"]]) {
        NSMutableDictionary *qqMapDic = [NSMutableDictionary dictionary];
        qqMapDic[@"title"] = @"腾讯地图";
        NSString *urlString =[[NSString stringWithFormat:@"qqmap://map/routeplan?type=drive&from=我的位置&to=%@&tocoord=%lf,%lf&policy=1&referer=tengxun",self.listModel.descriptionString,endLocation.latitude,endLocation.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
         qqMapDic[@"url"] = urlString;
        return qqMapDic;
    }
    return nil;
    
}

//- (NSDictionary *)getMapParamWithScheme:(NSString *)scheme
//{
//    NSMutableDictionary *param = [NSMutableDictionary dictionary];
//    if ([scheme isEqualToString:kGaoDeMapPathHost]) {
//        [param setValue:@"BGVIS1" forKey:@"sid"];
//        [param setValue:@(self.startCoordinate.latitude) forKey:@"slat"];
//        [param setValue:@(self.startCoordinate.longitude) forKey:@"slon"];
//        [param setValue:@"BGVIS2" forKey:@"did"];
//        [param setValue:@(self.destinationCoordinate.latitude) forKey:@"dlat"];
//        [param setValue:@(self.destinationCoordinate.longitude) forKey:@"dlon"];
////        [param setValue:self.mapInfo.title forKey:@"dname"];
//        [param setValue:@"0" forKey:@"t"];
//        [param setValue:@"SharedCarSuits" forKey:@"sourceApplication"];
//        [param setValue:@"app.soyoung://" forKey:@"backScheme"];
//    } else if (([scheme isEqualToString:kBaiDuMapPathHost])) {
////        NSString *origin = [NSString stringWithFormat:@"latlng:%f,%f|name:%@", self.startCoordinate.latitude, self.startCoordinate.longitude, @"我的位置"];
////        [param setValue:origin forKey:@"origin"];
////        NSString *destination = [NSString stringWithFormat:@"latlng:%f,%f|name:%@", self.destinationCoordinate.latitude, self.destinationCoordinate.longitude, self.mapInfo.title];
////        [param setValue:destination forKey:@"destination"];
////        [param setValue:@"driving" forKey:@"mode"];
////        [param setValue:@"gcj02" forKey:@"coord_type"];
////        [param setValue:@"app.soyoung://" forKey:@"src"];
//    }else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"qqmap://"]]) {
//        param[@"title"] = @"腾讯地图";
//        NSString *urlString = [[NSString stringWithFormat:@"qqmap://map/routeplan?from=我的位置&type=drive&tocoord=%f,%f&to=终点&coord_type=1&policy=0",self.destinationCoordinate.latitude, self.destinationCoordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        param[@"url"] = urlString;
//    }
//    return param.copy;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
