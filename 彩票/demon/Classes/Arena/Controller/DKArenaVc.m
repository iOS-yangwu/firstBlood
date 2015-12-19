//
//  DKArenaVc.m
//  demon
//
//  Created by 吴洋 on 15/11/22.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKArenaVc.h"

@interface DKArenaVc ()

@end

@implementation DKArenaVc

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置背景
    self.view.layer.contents=(__bridge id)[UIImage imageNamed:@"NLArenaBackground"].CGImage;
    
    //设置导航栏背景
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    UISegmentedControl *se = (UISegmentedControl *)self.navigationItem.titleView;

    [se setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [se setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    [se setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    [se setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];

    
 }



@end
