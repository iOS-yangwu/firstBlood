//
//  UIView+DKViewFrame.m
//  demon
//
//  Created by 吴洋 on 15/11/23.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "UIView+DKViewFrame.h"

@implementation UIView (DKViewFrame)

- (void)setX:(CGFloat)x{
    CGRect frameX=self.frame;
    frameX.origin.x=x;
    self.frame=frameX;
}

- (CGFloat)x{

    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    CGRect frameY=self.frame;
    frameY.origin.y=y;
    self.frame=frameY;

}

- (CGFloat)y{
    
    return self.frame.origin.y;
}

- (void)setW:(CGFloat)w{
    CGRect frameW=self.frame;
    frameW.size.width=w;
    self.frame=frameW;
}

- (CGFloat)w{
    
    return self.frame.size.width;
}

- (void)setH:(CGFloat)h{
    CGRect frameH=self.frame;
    frameH.size.height=h;
    self.frame=frameH;
}

- (CGFloat)h{
    
    return self.frame.size.height;
}





@end
