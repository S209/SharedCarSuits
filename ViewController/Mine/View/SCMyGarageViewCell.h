//
//  SCMyGarageViewCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SCMyGarageViewCellDelegate<NSObject>
@required
- (void)myGarageViewCellClickEditor;
- (void)myGarageViewCellClickDelete;
@end
@interface SCMyGarageViewCell : UITableViewCell
+ (instancetype)myGarageViewCellWithTable:(UITableView *)tableView;
@property (nonatomic, weak) id <SCMyGarageViewCellDelegate>delegate;
@end
