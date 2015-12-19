//
//  DKSettingProductCell.m
//  demon
//
//  Created by 吴洋 on 15/11/26.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKSettingProductCell.h"

@interface DKSettingProductCell ()
//@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *textLbl;
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;


@end


@implementation DKSettingProductCell

- (void)setProduct:(DKProduct *)product{
    _product=product;
    
    self.imageIcon.image=[UIImage imageNamed:product.icon];
//

    NSLog(@"%@",product.icon);
//    NSLog(@"%@",self.imageIcon.image);
    self.textLbl.text=product.title;


}




- (void)awakeFromNib{

    self.imageIcon.layer.cornerRadius=10;
    self.imageIcon.layer.masksToBounds=YES;



}


@end
