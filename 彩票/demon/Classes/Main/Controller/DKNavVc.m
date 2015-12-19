//
//  DKNavVc.m
//  demon
//
//  Created by 吴洋 on 15/11/22.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKNavVc.h"

@interface DKNavVc ()

@end

@implementation DKNavVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    

    

}

- (UIStatusBarStyle)preferredStatusBarStyle{

    return UIStatusBarStyleLightContent;
}

//隐藏状态栏
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    viewController.hidesBottomBarWhenPushed=YES;
//    NSLog(@"%@",NSStringFromClass([viewController  class]));
    [super pushViewController:viewController animated:YES];


}

@end
