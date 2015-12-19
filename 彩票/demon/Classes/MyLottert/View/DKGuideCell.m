//
//  DKGuideCell.m
//  demon
//
//  Created by 吴洋 on 15/11/26.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKGuideCell.h"
#import "UIView+DKViewFrame.h"
#import "DKmainBarVc.h"

@interface DKGuideCell ()
@property(nonatomic,weak)UIImageView *imageViewIcon;
@property(nonatomic ,weak)UIButton *btn;


@end

@implementation DKGuideCell

-(UIButton *)btn{
    if (_btn==nil) {
        UIButton *btn=[[UIButton alloc]init];
        [btn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [btn sizeToFit];
        [self addSubview:btn];
        [btn addTarget:self action:@selector(moveToApp) forControlEvents:UIControlEventTouchUpInside];
        _btn=btn;
        
    }

    return _btn;
}

- (void)moveToApp{
    
    
    [UIApplication sharedApplication].keyWindow.rootViewController=[DKmainBarVc initMainVc];



}


-(void)creatBtnwithIndex:(NSIndexPath *)index andCount:(int)count{

    if (index.row ==count-1) {
        self.btn.hidden=NO;
        
    }else {
    
        self.btn.hidden=YES;
    
    }

    

}

- (void)setImageIcon:(NSString *)imageIcon{
    _imageIcon=imageIcon;
    self.imageViewIcon.image=[UIImage imageNamed:imageIcon];



}

- (instancetype)initWithFrame:(CGRect)frame{

    if ([super initWithFrame:frame]) {
        
        UIImageView *imageIcon=[[UIImageView alloc]init];
        
        [self.contentView addSubview:imageIcon];

        self.imageViewIcon=imageIcon;
    }

    
    

    return [super initWithFrame:frame];
    
}

- (void)layoutSubviews{

    [super layoutSubviews];
    self.imageViewIcon.frame=self.bounds;
    self.btn.x=([UIScreen mainScreen].bounds.size.width-self.btn.bounds.size.width)*0.5;
    self.btn.y=[UIScreen mainScreen].bounds.size.height*0.9;


}



@end
