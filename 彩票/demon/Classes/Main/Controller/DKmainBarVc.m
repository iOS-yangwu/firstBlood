//
//  DKmainBarVc.m
//  demon
//
//  Created by 吴洋 on 15/11/21.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKmainBarVc.h"
#import "DKbarView.h"

@interface DKmainBarVc ()<DKbarViewDelegate>

@end

@implementation DKmainBarVc

- (void)viewDidLoad {
    [super viewDidLoad];
   // 创建控制器
    
    UINavigationController *navVc1=(UINavigationController *)[self initWithSBname:@"Arena"];

    UINavigationController *navVc2= (UINavigationController *)[self initWithSBname:@"Discovery"];
    UINavigationController *navVc3= (UINavigationController *)[self initWithSBname:@"Guide"];
    UINavigationController *navVc4= (UINavigationController *)[self initWithSBname:@"Hall"];
    UINavigationController *navVc5= (UINavigationController *)[self initWithSBname:@"History"];
 //添加控制器
    self.viewControllers=@[navVc4,navVc1,navVc2,navVc5,navVc3];
    DKbarView *barView=[[DKbarView alloc]init];
    barView.frame=self.tabBar.bounds;

    for (int i=0; i<self.viewControllers.count; i++) {


    NSString *imagenameNor=[NSString stringWithFormat:@"TabBar%d",i+1];
    NSString *imagenameSel=[NSString stringWithFormat:@"TabBar%dSel",i+1];
    UIImage *inameNor=[UIImage imageNamed:imagenameNor];
    UIImage *inameSel=[UIImage imageNamed:imagenameSel];
    [barView addBtnWithimageNor:inameNor andImageSel:inameSel];
    

    }

    [self.tabBar addSubview:barView];
    barView.delegate=self;

    
    
}

- (void)barView:(DKbarView *)barView withIndex:(NSInteger)index{

    self.selectedIndex=index;


}

+ (instancetype)initMainVc{
    DKmainBarVc *mainVc=[[DKmainBarVc alloc]init];

    return mainVc;
}


- (UIViewController *)initWithSBname:(NSString *)SBName{

    UIStoryboard *sb=[UIStoryboard storyboardWithName:SBName bundle:nil];
    return sb.instantiateInitialViewController;

}


@end
