//
//  SCEvaluateRowOneTableViewCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/23.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCOrderListModel;
@interface SCEvaluateRowOneTableViewCell : UITableViewCell
@property (nonatomic, strong) SCOrderListModel * listModel;
@property (nonatomic, copy) NSString * contentString;
+ (instancetype)evaluateRowOneTableViewCellWithTableView:(UITableView *)tableView;
+ (CGFloat)cellHeight;
@end
