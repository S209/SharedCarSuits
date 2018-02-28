//
//  SCHomePageSectionOneCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SCHomePageSectionOneCellDelegate<NSObject>
@required
- (void)homePageSectionOneCellReceiveCoupons;
- (void)homePageSectionOneCellClickLoadMore;
- (void)homePageDidSeleItemWitIndex:(NSInteger)index;
@end
@interface SCHomePageSectionOneCell : UITableViewCell
@property (nonatomic, weak) id <SCHomePageSectionOneCellDelegate>delegate;
+ (instancetype)homePageSectionOneWithTableView:(UITableView *)tableView;
@end
