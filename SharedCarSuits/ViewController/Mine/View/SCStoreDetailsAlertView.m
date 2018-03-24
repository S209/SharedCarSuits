//
//  SCStoreDetailsAlertView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/24.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCStoreDetailsAlertView.h"
#import "SCManager+CommonMethods.h"
static const CGFloat cellHeight = 49;
@interface SCStoreDetailsAlertView()
@property (nonatomic, assign) NSInteger numberOfMap;
@property (nonatomic, strong) NSMutableArray * mapArray;
@end
@implementation SCStoreDetailsAlertView

- (NSMutableArray *)mapArray
{
    if (!_mapArray) {
        _mapArray = [NSMutableArray array];
    }
    return _mapArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.37];
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    UIWindow * window = [UIApplication sharedApplication].windows.lastObject;
    [window addSubview:self];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:btn];
    btn.frame = self.bounds;
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}


- (CGFloat)calculateNumberOfMap
{
    NSArray * pathHostArray = @[kBaiDuMapPathHost,kGaoDeMapPathHost,kQQMaoPathHost];
    NSInteger numberOfMap = 0;
    [self.mapArray removeAllObjects];
    [self.mapArray addObject:@"用iPhone自带地图导航"];
    for (NSUInteger i = 0; i < pathHostArray.count; i++) {
        BOOL flag = [[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:[pathHostArray safeObjectAtIndex:i]]];
        if (flag) {
            numberOfMap++;
            NSString * mapString = [pathHostArray safeObjectAtIndex:i];
            if ([mapString containsString:@"baidu"]) {
                [self.mapArray addObject:@"用百度地图导航"];
            }else if ([mapString containsString:@"iosamap"]){
                [self.mapArray addObject:@"用高德地图导航"];
            }else if ([mapString containsString:@"qq"]){
                [self.mapArray addObject:@"用腾讯地图导航"];
            }
        }
    }
    return numberOfMap+1;
}

- (void)showWithMapClick:(MapClickBlock)clickBlock
{
    self.mapClickBlock = clickBlock;
    UIView * tipView = [[UIView alloc] init];
    tipView.backgroundColor = [UIColor whiteColor];
    [self addSubview:tipView];
  
    CGFloat tipsViewHeight = [self calculateNumberOfMap] * cellHeight + 55;

    tipView.frame = CGRectMake(0, SCREEN_HEIGHT-tipsViewHeight, SCREEN_WIDTH, tipsViewHeight);
    
    UILabel * exitLabel = [[UILabel alloc] init];
    [tipView addSubview:exitLabel];
    exitLabel.backgroundColor = [UIColor whiteColor];
    exitLabel.text = @"选择地图";
    exitLabel.font = [UIFont sy_boldFont16];
    exitLabel.textColor = [UIColor sc_colorWith444444];
    exitLabel.textAlignment = NSTextAlignmentCenter;
    exitLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    
   [[SCManager shareInstance] bezierPathLeftTopAndRightTopWithView:tipView withRadius:5];
    
    UIView * segmentView = [[UIView alloc] init];
    [tipView addSubview:segmentView];
    segmentView.backgroundColor = [UIColor sc_colorWithf8f8f8];
    segmentView.frame = CGRectMake(0, CGRectGetMaxY(exitLabel.frame), SCREEN_WIDTH, 5);
    
    CGFloat topY= 0;
    NSInteger numberOfMap = [self calculateNumberOfMap];
    for (NSUInteger i = 0; i < numberOfMap; i++) {
        topY = 55 + cellHeight * i;
        UIButton * mapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [mapBtn setTitleColor:[UIColor sc_colorWith356CF8] forState:UIControlStateNormal];
        [tipView addSubview:mapBtn];
        [mapBtn setTitle:[self.mapArray safeObjectAtIndex:i] forState:UIControlStateNormal];
        mapBtn.titleLabel.font = [UIFont sy_font16];
        mapBtn.backgroundColor = [UIColor whiteColor];

        mapBtn.frame = CGRectMake(0, topY, SCREEN_WIDTH, cellHeight);
        [mapBtn addTarget:self action:@selector(mapBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        mapBtn.tag = 300+i;
        UILabel * segmentView = [[UILabel alloc] init];
        [mapBtn addSubview:segmentView];
        segmentView.backgroundColor = [UIColor sc_colorWithe5e5e5];

        segmentView.frame = CGRectMake(0, cellHeight-0.5, SCREEN_WIDTH, 0.5);
    }
    [self updateConstraintsIfNeeded];
}





- (void)mapBtnClick:(UIButton *)sender
{
    NSInteger tag = sender.tag - 300;
    if (self.mapClickBlock) {
        NSString * mapString = [self.mapArray safeObjectAtIndex:tag];
        self.mapClickBlock(mapString);
    }
}
    
- (void)diss
{
    [self removeFromSuperview];
}
    
- (void)btnClick
{
    [self diss];
}
@end
