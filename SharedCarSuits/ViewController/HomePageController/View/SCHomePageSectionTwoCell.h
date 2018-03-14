//
//  SCHomePageSectionTwoCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SCHomePageSectionTwoCellDelegate<NSObject>
@required
- (void)homePageSectionTwoCellClickWithObj:(id)obj;
@end
@interface SCHomePageSectionTwoCell : UITableViewCell
@property (nonatomic, weak) id <SCHomePageSectionTwoCellDelegate>delegate;
+ (instancetype)hoemPageSectionTwoWithTableView:(UITableView *)tableView;
@end
