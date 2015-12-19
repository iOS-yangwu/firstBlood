//
//  DKMyLorray.m
//  demon
//
//  Created by 吴洋 on 15/11/23.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKMyLorray.h"
#import "DKSettingVc.h"



@interface DKMyLorray ()
@property (weak, nonatomic) IBOutlet UIButton *lyBtn;

@end

@implementation DKMyLorray

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBtnImage];
//    UIBarButtonItem *item = self.navigationItem.leftBarButtonItem;
//    UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    item2.width=20;
//    
//    self.navigationItem.leftBarButtonItems=@[item,item2];
    
    
    
}

- (void)setBtnImage{

    //设置我的彩票设置按钮
    UIImage *imageNor=[UIImage imageNamed:@"RedButton"];
    UIImage *imageHei=[UIImage imageNamed:@"RedButtonPressed"];
    UIImage *scrNor=[imageNor stretchableImageWithLeftCapWidth:imageNor.size.width*0.5 topCapHeight:imageNor.size.height*0.5];
    UIImage *scrHei=[imageHei stretchableImageWithLeftCapWidth:imageHei.size.width*0.5 topCapHeight:imageHei.size.height*0.5];
    
    [self.lyBtn setBackgroundImage:scrNor forState:UIControlStateNormal];
    [self.lyBtn setBackgroundImage:scrHei forState:UIControlStateHighlighted];

}

- (IBAction)goToSettingVc:(id)sender {
    
    DKSettingVc *setVc=[[DKSettingVc alloc]initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:setVc animated:YES];
    setVc.title=@"设置";
    setVc.plistName=@"settingPlist.plist";
    
    
}



@end
