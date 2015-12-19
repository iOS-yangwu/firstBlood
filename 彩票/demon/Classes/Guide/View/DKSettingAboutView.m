//
//  DKSettingAboutView.m
//  demon
//
//  Created by 吴洋 on 15/11/25.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKSettingAboutView.h"

@implementation DKSettingAboutView

+ (instancetype)creatSettingAboutView{

    DKSettingAboutView *view=[[[NSBundle mainBundle]loadNibNamed:@"DKSettingAboutView" owner:nil options:nil]lastObject];
    
    return view;

}
@end
