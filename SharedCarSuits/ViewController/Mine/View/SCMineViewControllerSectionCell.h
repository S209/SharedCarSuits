//
//  SCMineViewControllerSectionZeroCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/12.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCMineViewControllerSectionCell : UITableViewCell
+ (instancetype)mineWithTableView:(UITableView *)tableView;
- (void)updateContentWithImageName:(NSString *)imageName content:(NSString *)contetn;
@end
