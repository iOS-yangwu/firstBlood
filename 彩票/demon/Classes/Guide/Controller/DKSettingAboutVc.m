//
//  DKSettingAboutVc.m
//  demon
//
//  Created by 吴洋 on 15/11/25.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKSettingAboutVc.h"
#import "DKSettingAboutView.h"

@interface DKSettingAboutVc ()

@end

@implementation DKSettingAboutVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView=[DKSettingAboutView creatSettingAboutView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
