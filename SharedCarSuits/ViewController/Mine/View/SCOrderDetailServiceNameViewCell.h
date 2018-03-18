//
//  SCOrderDetailServiceNameViewCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/3/18.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCOrderDetailServiceNameViewCell : UITableViewCell
+ (instancetype)orderDetailServiceNameViewCellWithTableView:(UITableView *)tableView price:(NSString *)price;
+ (CGFloat)cellHeight;
@end
