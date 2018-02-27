//
//  SCMyGarageViewCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCMyGarageListPageModel;
@protocol SCMyGarageViewCellDelegate<NSObject>
@required
- (void)myGarageViewCellClickDefaultWithModel:(SCMyGarageListPageModel *)pageModel;
- (void)myGarageViewCellClickEditorWihtModel:(SCMyGarageListPageModel *)pageModel;
- (void)myGarageViewCellClickDeleteWithModel:(SCMyGarageListPageModel *)pageModel;
@end
@interface SCMyGarageViewCell : UITableViewCell
+ (instancetype)myGarageViewCellWithTable:(UITableView *)tableView;
@property (nonatomic, weak) id <SCMyGarageViewCellDelegate>delegate;
@property (nonatomic, strong) SCMyGarageListPageModel * pageModel;
@end
