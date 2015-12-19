//
//  DKGuideCell.h
//  demon
//
//  Created by 吴洋 on 15/11/26.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKGuideCell : UICollectionViewCell
@property(nonatomic,copy)NSString *imageIcon;

- (void)creatBtnwithIndex:(NSIndexPath *)index andCount:(int) count;

@end
