//
//  DKHallVc.m
//  demon
//
//  Created by 吴洋 on 15/11/22.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKHallVc.h"

@interface DKHallVc ()
@property(nonatomic,weak)UIView *cover;
@property(nonatomic,weak)UIImageView *imageview;
@end

@implementation DKHallVc

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image=[UIImage imageNamed:@"CS50_activity_image"];
    image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    UIBarButtonItem *bar=[[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(activity)];
    self.navigationItem.leftBarButtonItem = bar;
    
    
}


- (void)activity{
    
    UIView *cover=[[UIView alloc]init];
    cover.backgroundColor=[UIColor blackColor];
    cover.alpha=0.5;
    cover.frame=[UIScreen mainScreen].bounds;
    [self.tabBarController.view addSubview:cover];
    self.cover=cover;
    
    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"showActivity"]];
    imageView.center=self.view.center;
    imageView.userInteractionEnabled=YES;
    [self.tabBarController.view addSubview:imageView];
    self.imageview=imageView;
    
    UIButton *btn=[[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    [btn sizeToFit];
    CGFloat btnX=imageView.bounds.size.width-btn.bounds.size.width;
    CGFloat btnW=btn.bounds.size.width;
    CGFloat btnH=btn.bounds.size.height;
    btn.frame=CGRectMake(btnX , 0, btnW, btnH);
    [imageView addSubview:btn];
    [btn addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
  
}


- (void)remove{
    [UIView animateWithDuration:0.25 animations:^{
        self.imageview.alpha=0;
        self.cover.alpha=0;
        
    } completion:^(BOOL finished) {
        [self.imageview removeFromSuperview];
        [self.cover removeFromSuperview];
    }];



}



@end
