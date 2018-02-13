//
//  SCEditorIconView.h
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/13.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, TypeImageView){
    TypeImageViewTakeAPhoto = 0,
    TypeImageViewPhoneAlbumSelected = 1,
};
@protocol SCEditorIconViewDelegate<NSObject>
@required
- (void)editorIconType:(TypeImageView)typeImage;
@end
@interface SCEditorIconView : UIView
@property (nonatomic, weak) id <SCEditorIconViewDelegate>delegate;
- (void)show;
- (void)diss;
@end
