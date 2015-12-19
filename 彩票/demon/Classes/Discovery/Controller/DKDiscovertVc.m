//
//  DKDiscovertVc.m
//  demon
//
//  Created by 吴洋 on 15/11/23.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKDiscovertVc.h"
#import "UIView+DKViewFrame.h"

@interface DKDiscovertVc ()
@property(nonatomic,weak)UIView *blueView;
@end

@implementation DKDiscovertVc

- (UIView *)blueView{
    if (!_blueView) {
        UIView *blueView=[[UIView alloc]init];
        [blueView setBackgroundColor:[UIColor blueColor]];
        blueView.w=[UIScreen mainScreen].bounds.size.width;
        blueView.y=64;
        [self.view addSubview:blueView];
        _blueView=blueView;
    }

    return _blueView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self blueView];

    
}

- (IBAction)discovertBtnDidClick:(UIButton*)sender {
    [UIView animateWithDuration:0.25 animations:^{
         self.blueView.h=self.blueView.h ? 0 : 44;


         sender.imageView.transform=CGAffineTransformRotate(sender.imageView.transform, M_PI);
    }];
   
    
}

@end
