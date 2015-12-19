//
//  DKDiscovery02.m
//  demon
//
//  Created by 吴洋 on 15/11/23.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKDiscovery02.h"

@interface DKDiscovery02 ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DKDiscovery02

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image=[UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *images=[UIImage imageNamed:@"lucky_entry_light1"];
    NSArray *arr=@[image,images];

    self.imageView.animationImages=arr;
    self.imageView.animationDuration=0.5;
    [self.imageView startAnimating];
    
    
}




@end
