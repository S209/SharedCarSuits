//
//  SCMyAppointmentViewCell.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/23.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCAppointmentServiceModel;
typedef void (^MyAppointmentViewCellSelectedService)(SCAppointmentServiceModel * serviceModel);
typedef void (^MyAppointmentViewCelldeleteService)(SCAppointmentServiceModel * serviceModel);
@interface SCMyAppointmentViewCell : UITableViewCell
@property (nonatomic, copy) MyAppointmentViewCellSelectedService selectedBlock;
@property (nonatomic, copy) MyAppointmentViewCelldeleteService deleteBlock;
@property (nonatomic, strong) SCAppointmentServiceModel * serviceModel;
+ (instancetype)myAppointmentViewCellWithTabeleView:(UITableView *)tableView;
+ (CGFloat)cellHeight;
@end
