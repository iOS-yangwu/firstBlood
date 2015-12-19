//
//  DKbarView.h
//  demon
//
//  Created by 吴洋 on 15/11/21.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DKbarView;
@protocol DKbarViewDelegate <NSObject>

- (void)barView:(DKbarView *)barView withIndex:(NSInteger)index;

@end

@interface DKbarView : UIView
@property(nonatomic,weak)id<DKbarViewDelegate>delegate;

- (void)addBtnWithimageNor:(UIImage *)imageNor andImageSel:(UIImage*)imageSel;
@end
