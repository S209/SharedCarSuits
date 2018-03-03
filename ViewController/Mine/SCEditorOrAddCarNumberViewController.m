//
//  SCEditorOrAddCarNumberViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/3.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCEditorOrAddCarNumberViewController.h"
#import "SCRegisterViewCarInfoView.h"
#import "SCChoiseAreaView.h"
#import "SCChoiseCarNumberView.h"
#import "SCManager+RequestInterface.h"
#import "SCManager+MBProgressHUD.h"
#import "SCChoiseBrandViewController.h"
#import "SCMyGarageListPageModel.h"
@interface SCEditorOrAddCarNumberViewController ()<SCRegisterViewCarInfoViewDelegate,SCChoiseAreaViewDelegate,SCChoiseCarNumberViewDelegate>
@property (nonatomic, weak) SCChoiseAreaView * areaView;
@property (nonatomic, weak) SCChoiseCarNumberView * carNumberView;
@property (nonatomic, weak) SCRegisterViewCarInfoView * carInfo;
@property (nonatomic, strong) NSMutableArray * carNumberArray;
@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * regionString;
@end

@implementation SCEditorOrAddCarNumberViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationWithTitle:@"编辑/添加车牌"];
    [self sy_leftBarButtonItem];
    [self setupView];
    self.carNumberArray = [NSMutableArray arrayWithCapacity:7];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCarName:) name:SCSelectCarSuccess object:nil];
}

- (void)setupView
{
    SCRegisterViewCarInfoView * carInfo = [[SCRegisterViewCarInfoView alloc] init];
    self.carInfo = carInfo;
     carInfo.pageModel = self.pageModel;
    carInfo.delegate = self;
    [self.view addSubview:carInfo];
    [carInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
    
    SCChoiseAreaView * areaView = [[SCChoiseAreaView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    areaView.delegate = self;
    areaView.hidden = YES;
    self.areaView = areaView;
    [self.view addSubview:areaView];
    
    SCChoiseCarNumberView * carNumberView = [[SCChoiseCarNumberView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    carNumberView.delegate = self;
    carNumberView.hidden = YES;
    self.carNumberView = carNumberView;
    [self.view addSubview:carNumberView];
    
}

#pragma mark 创建选择车牌的View
- (void)carNumberBtnClickWithIndex:(NSInteger)index
{
    if (index == 0) {
        self.areaView.hidden = NO;
        self.carNumberView.hidden = YES;
    }else{
        self.areaView.hidden = YES;
        self.carNumberView.hidden = NO;
    }
}

- (void)sureBtnClick
{
    NSMutableString * carNumberString = [[NSMutableString alloc] init];
    [self.carNumberArray insertObject:self.regionString atIndex:0];
    for (NSUInteger i = 0; i < self.carNumberArray.count; i++) {
        [carNumberString appendString:[self.carNumberArray safeObjectAtIndex:i]];
    }

    if (_excuteType == CarNumberExcuteTypeWithEditor) {
        [[SCManager shareInstance]myGarageEditWithCarId:[NSString stringWithFormat:@"%zd",_pageModel.carId] carModel:self.content carNum:carNumberString success:^(NSURLSessionDataTask *serializer, id responseObject) {
              [self.navigationController popViewControllerAnimated:YES];
        } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
            
        } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
            
        }];
    }else{
        [[SCManager shareInstance] myGarageCarAddWithCarNum:carNumberString carModel:self.content success:^(NSURLSessionDataTask *serializer, id responseObject) {
            [self.navigationController popViewControllerAnimated:YES];
        } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
            
        } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
            
        }];
    }
}

- (void)choiseBrandLabelClick
{
    SCChoiseBrandViewController * brandViewController = [[SCChoiseBrandViewController alloc] init];
    [self.navigationController pushViewController:brandViewController animated:YES];
}


- (void)setPageModel:(SCMyGarageListPageModel *)pageModel
{
    _pageModel = pageModel;
   
}
#pragma mark choiseAreaViewDelegate
- (void)choiseAreaViewClickCancelBtn
{
    [self.carInfo updateCarInfoWithInfo:@" " andIndex:0 btnClickState:NO];
}


- (void)ChoiseAreaViewClickSureBtn
{
    self.areaView.hidden = YES;
}

- (void)ChoiseAreaViewClickItemWithContent:(NSString *)content
{
    [self.carInfo updateCarInfoWithInfo:content andIndex:0 btnClickState:YES];
    self.regionString = content;
}

#pragma mark choiseCarNumberViewDelegate
- (void)choiseCarNumberViewDidCancel
{
    if (self.carNumberView.carNumberIndex >= 0) {
        [self.carInfo updateCarInfoWithInfo:@"" andIndex:self.carNumberView.carNumberIndex btnClickState:NO];
        self.carNumberView.carNumberIndex -= 1;
    }
}

- (void)choiseCarNumberViewDidSure
{
    self.carNumberView.hidden = YES;
}

- (void)choiseCarNumberViewDidItemWithContent:(NSString *)content andIndex:(NSInteger)index
{
    if (index > 1 && index <= 6) {
        [self.carNumberArray insertObject:content atIndex:index-1];
        [self.carInfo updateCarInfoWithInfo:content andIndex:index btnClickState:YES];
    }
}


- (void)updateCarName:(NSNotification *)notific
{
    NSString * carName = notific.object;
    self.content = carName;
    [self.carInfo updateCarName:carName];
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
