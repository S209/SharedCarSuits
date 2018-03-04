//
//  SCMyGarageViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCMyGarageViewController.h"
#import "SCMyGarageViewCell.h"
#import "SCMyGarageViewDeletViewAlertView.h"
#import "SCManager+RequestInterface.h"
#import "SCManager+CommonMethods.h"
#import "SCMyGarageListPageModel.h"
#import "SCDIYHeader.h"
#import "SCEditorOrAddCarNumberViewController.h"
@interface SCMyGarageViewController ()<UITableViewDataSource,UITableViewDelegate,SCMyGarageViewCellDelegate,SCMyGarageViewDeletViewAlertViewDelegate>
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, assign) NSInteger length;
@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, copy) NSString * deleteCarId;
@end

@implementation SCMyGarageViewController
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self sy_leftBarButtonItem];
    [self setRightBarButtonItem];
    [self setNavigationWithTitle:@"我的车库"];
    [self setupView];
}

- (void)setRightBarButtonItem
{
    UIButton * addCarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addCarBtn setImage:[UIImage imageNamed:@"mycar_btn_add"] forState:UIControlStateNormal];
    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:addCarBtn];
    addCarBtn.frame = CGRectMake(0, 0, 40, 40);
    self.navigationItem.rightBarButtonItem = rightBarButton;
    [addCarBtn addTarget:self action:@selector(addCarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addCarBtnClick:(UIButton *)sender
{
    SCEditorOrAddCarNumberViewController * editorOrAddController = [[SCEditorOrAddCarNumberViewController alloc] init];
    editorOrAddController.excuteType = CarNumberExcuteTypeWithAdd;
    [self.navigationController pushViewController:editorOrAddController animated:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadNewData];
}

- (void)loadNewData
{
    self.length = 10;
    [self.dataArray removeAllObjects];
    [self requestDataWithLength:@"10"];
}

- (void)loadMoreData
{
    self.length += 10;
    [self requestDataWithLength:[NSString stringWithFormat:@"%zd",self.length]];
}

- (void)requestDataWithLength:(NSString *)length
{
    SCMyGarageListPageModel * model = [self.dataArray lastObject];
    NSString * carIdString;
    if(model.carId){
        carIdString = [NSString stringWithFormat:@"%zd",model.carId];
    }else
    {
        carIdString = @"0";
    }
    WEAKSELF
    [[SCManager shareInstance] myGarageWithId:carIdString andLength:length success:^(NSURLSessionDataTask *serializer, id responseObject) {
        STRONGSELF
        NSInteger hasMore = [[responseObject objectForKey:@"ifHave"] integerValue];
      
        if ([length integerValue] == 10) {
            [strongSelf.dataArray removeAllObjects];
            [strongSelf.tableView.mj_header endRefreshing];
        }
        if (hasMore) {
            strongSelf.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        }else{
            strongSelf.tableView.mj_footer = nil;
        }

        NSArray * myGarageListArray = [responseObject objectForKey:@"list"];
        if ([myGarageListArray isKindOfClass:[NSArray class]] && myGarageListArray.count > 0) {
            for (NSDictionary * myGarageDict in myGarageListArray) {
                SCMyGarageListPageModel * pageModel = [SCMyGarageListPageModel yy_modelWithDictionary:myGarageDict];
                [strongSelf.dataArray addObject:pageModel];
            }
        }
        [strongSelf.tableView reloadData];
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
          STRONGSELF
        [strongSelf.tableView.mj_header endRefreshing];
        [strongSelf.tableView.mj_footer endRefreshing];
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
          STRONGSELF
        [strongSelf.tableView.mj_header endRefreshing];
        [strongSelf.tableView.mj_footer endRefreshing];
    }];
}


- (void)setupView
{
    UITableView * tableView = [[UITableView alloc] init];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
    tableView.backgroundColor = [UIColor sc_colorWithf8f8f8];
    tableView.mj_header = [SCDIYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    tableView.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    UIView * tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    tableHeaderView.backgroundColor = [UIColor sc_colorWithF4F4F4];
    tableView.tableHeaderView = tableHeaderView;

}

#pragma mark
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
    SCMyGarageViewCell * viewCell = [SCMyGarageViewCell myGarageViewCellWithTable:tableView];
    viewCell.delegate = self;
    SCMyGarageListPageModel * pageModel = [self.dataArray safeObjectAtIndex:indexPath.row];
    viewCell.pageModel = pageModel;
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

#pragma mark SCMyGarageViewCellDelegate
- (void)myGarageViewCellClickEditorWihtModel:(SCMyGarageListPageModel *)pageModel
{
    SCEditorOrAddCarNumberViewController * editorOrAddController = [[SCEditorOrAddCarNumberViewController alloc] init];
    editorOrAddController.excuteType = CarNumberExcuteTypeWithEditor;
    editorOrAddController.pageModel = pageModel;
    [self.navigationController pushViewController:editorOrAddController animated:YES];
}


- (void)myGarageViewCellClickDefaultWithModel:(SCMyGarageListPageModel *)pageModel
{
    [[SCManager shareInstance] myGarageCarDefaultWithCarId:[NSString stringWithFormat:@"%zd",pageModel.carId] success:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        
    }];
}

- (void)myGarageViewCellClickDeleteWithModel:(SCMyGarageListPageModel *)pageModel
{
    SCMyGarageViewDeletViewAlertView * deleteView = [[SCMyGarageViewDeletViewAlertView alloc] init];
    deleteView.delegate = self;
    [deleteView showWithCarName:pageModel.carModel];
    self.deleteCarId = [NSString stringWithFormat:@"%zd",pageModel.carId];
    [self.tableView reloadData];
}


#pragma mark
- (void)deleteCarInfo
{
    [[SCManager shareInstance] myGarageDeleteWithCarId:self.deleteCarId success:^(NSURLSessionDataTask *serializer, id responseObject) {
        [self.tableView reloadData];
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        
    }];
}

#pragma mark addCar
- (void)addCar
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
