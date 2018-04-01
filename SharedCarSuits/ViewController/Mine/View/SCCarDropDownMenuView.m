//
//  SCCarDropDownMenuView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/4/1.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCCarDropDownMenuView.h"
#import "SCMyGarageListPageModel.h"
@interface SCCarDropDownMenuView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;
@end
@implementation SCCarDropDownMenuView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    UITableView * tableView = [[UITableView alloc] init];
    self.tableView = tableView;
    [self addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.frame = self.bounds;
}

#pragma mark UITableViewDelegate
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
    static NSString * idDes = @"SCCarDropDownMenuViewIDdes" ;
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idDes];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idDes];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel * carLabel = [[UILabel alloc] init];
        carLabel.tag = 300;
        [cell.contentView addSubview:carLabel];
        carLabel.font = [UIFont sy_font13];
        carLabel.textColor = [UIColor blackColor];
        carLabel.backgroundColor = [UIColor sc_colorWithe5e5e5];
        carLabel.layer.masksToBounds = YES;
        [carLabel.layer setCornerRadius:17.5];
        [carLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell.contentView.mas_left).with.offset(10);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
        }];
    }
 
    SCMyGarageListPageModel * pageModel = [self.dataArray safeObjectAtIndex:indexPath.row];
    UILabel * label = [cell viewWithTag:300];
    label.text = pageModel.carModel;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 25;
}

- (void)setDataArray:(NSMutableArray<SCMyGarageListPageModel *> *)dataArray
{
    _dataArray = dataArray;
    [self.tableView reloadData];
}

@end
