//
//  DKSettingCell.h
//  demon
//
//  Created by 吴洋 on 15/11/24.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKSettingCell : UITableViewCell

+ (instancetype)creatCellWithTableView:(UITableView *)tableView andDict:(NSDictionary *)dict;

@property(nonatomic,strong)NSDictionary *dict;

- (void)setTextFiledText:(NSString *)str;

@end
