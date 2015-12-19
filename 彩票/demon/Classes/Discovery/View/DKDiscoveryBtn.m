//
//  DKDiscoveryBtn.m
//  demon
//
//  Created by 吴洋 on 15/11/23.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKDiscoveryBtn.h"
#import "UIView+DKViewFrame.h"
@implementation DKDiscoveryBtn

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.x=0;
    self.imageView.x=self.titleLabel.frame.size.width;
//    CGRect titleFm=self.titleLabel.frame;
//    titleFm=CGRectMake(0, titleFm.origin.y, titleFm.size.width, titleFm.size.height);
//    self.titleLabel.frame=titleFm;
//    
//    CGRect imageFm=self.imageView.frame;
//    imageFm=CGRectMake(titleFm.size.width, imageFm.origin.y, imageFm.size.width, imageFm.size.height);
//    self.imageView.frame=imageFm;
//    
    
    
}

@end
