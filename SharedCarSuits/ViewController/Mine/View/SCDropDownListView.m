//
//  SCDropDownListView.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/4/1.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCDropDownListView.h"
#import "SCMyGarageListPageModel.h"

@interface SCDropDownListView () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;
@end
@implementation SCDropDownListView

- (instancetype) initWithFrame:(CGRect)frame
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
        cell.backgroundColor = [UIColor sc_colorWithe5e5e5];
        cell.layer.masksToBounds = YES;
        [cell.layer setCornerRadius:12.5];
        UILabel * carLabel = [[UILabel alloc] init];
        carLabel.tag = 300;
        [cell.contentView addSubview:carLabel];
        carLabel.font = [UIFont sy_font12];
        carLabel.textColor = [UIColor blackColor];
        carLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        carLabel.numberOfLines = 1;
        [carLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell.contentView.mas_left).with.offset(10);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.left.equalTo(cell.contentView.mas_left).with.offset(12);
            make.right.equalTo(cell.contentView.mas_right).with.offset(-20);
        }];
    }
    
    SCMyGarageListPageModel * pageModel = [self.dataArray safeObjectAtIndex:indexPath.row];
    UILabel * label = [cell viewWithTag:300];
    label.text = pageModel.carNum;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_delegate respondsToSelector:@selector(clickCarDropDownMenuView)]) {
        [self.delegate clickCarDropDownMenuView];
    }
}

@end
