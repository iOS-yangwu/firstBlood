//
//  DKbarView.m
//  demon
//
//  Created by 吴洋 on 15/11/21.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKbarView.h"

@interface DKBtn :UIButton


@end
@implementation DKBtn

- (void)setHighlighted:(BOOL)highlighted{}
//- (CGRect)imageRectForContentRect:(CGRect)contentRect{
//    
//    return CGRectMake(0, 0, 75, 49);
//}

@end


@interface DKbarView ()
@property(nonatomic,weak)UIButton *currentBtn;

@end

@implementation DKbarView

- (void)addBtnWithimageNor:(UIImage *)imageNor andImageSel:(UIImage*)imageSel{
    DKBtn *btn=[[DKBtn alloc]init];
    

    [btn setImage: imageNor forState:UIControlStateNormal];
    [btn setImage: imageSel forState:UIControlStateSelected];
    
    
    [btn addTarget:self action:@selector(didClickBarBtn:) forControlEvents:UIControlEventTouchDown];
    

    [self addSubview:btn];

}

- (void)layoutSubviews{


    [super layoutSubviews];
    for (int i=0; i<self.subviews.count; i++) {
        DKBtn *btn = (DKBtn *)self.subviews[i];
        CGFloat w=[UIScreen mainScreen].bounds.size.width/self.subviews.count;
        CGFloat h=49;
        CGFloat x=i*w;
        CGFloat y=0;
        [btn setFrame: CGRectMake(x, y, w, h)];
        [btn setTag:i];
        if (i==0) {
            [self didClickBarBtn:self.subviews[0]];
            
        }

    }


}

- (void)didClickBarBtn:(UIButton *)sender{
    self.currentBtn.selected=NO;
    sender.selected=YES;
    self.currentBtn=sender;
    [self.delegate barView:self withIndex:sender.tag];

}

@end
