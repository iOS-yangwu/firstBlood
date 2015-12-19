//
//  DKGuideVc.m
//  demon
//
//  Created by 吴洋 on 15/11/26.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKGuideVc.h"
#import "DKGuideCell.h"
#import "UIView+DKViewFrame.h"

@interface DKGuideVc ()
@property(nonatomic,weak)UIImageView *guide;
@property(nonatomic,weak)UIImageView *guideLargeText;
@property(nonatomic,weak)UIImageView *guideSmallText;

@end

@implementation DKGuideVc

- (instancetype)init{

    UICollectionViewFlowLayout *flow=[[UICollectionViewFlowLayout alloc]init];
    
    flow.minimumLineSpacing=0;

    flow.itemSize=[UIScreen mainScreen].bounds.size;
    
    flow.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:flow];

}

+ (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{

    return [self init];

}



static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.collectionView registerClass:[DKGuideCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self setupColl];
    //添加图片框
    
    UIImageView *guide=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:guide];
    self.guide=guide;
    
    UIImageView *imageMid=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLine"]];
    imageMid.x=-200;
    [self.collectionView addSubview:imageMid];
    
    UIImageView *guideLargeText=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    guideLargeText.y=[UIScreen mainScreen].bounds.size.height*0.7;
    [self.collectionView addSubview:guideLargeText];
    self.guideLargeText=guideLargeText;
    
    UIImageView *guideSmallText=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    guideSmallText.y=[UIScreen mainScreen].bounds.size.height*0.8;
    [self.collectionView addSubview:guideSmallText];
    self.guideSmallText=guideSmallText;
    

}

- (void)setupColl{

    self.collectionView.bounces=NO;
    
    self.collectionView.showsVerticalScrollIndicator=NO;
    
    self.collectionView.showsHorizontalScrollIndicator=NO;
    
    self.collectionView.pagingEnabled=YES;

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat offset=scrollView.contentOffset.x;
    
    int page=offset/scrollView.bounds.size.width+1;
    CGFloat moveX;
    if (self.guide.x>offset) {
        moveX=offset-[UIScreen mainScreen].bounds.size.width;

        
    }else{
        moveX=offset+[UIScreen mainScreen].bounds.size.width;

    
    }
    self.guide.x=moveX;
    
    self.guideLargeText.x=moveX;
    
    self.guideSmallText.x=moveX;
    
    NSString *guide=[NSString stringWithFormat:@"guide%d",page];

    NSString *guideLargeText=[NSString stringWithFormat:@"guideLargeText%d",page];

    NSString *guideSmallText=[NSString stringWithFormat:@"guideSmallText%d",page];

    self.guide.image=[UIImage imageNamed:guide];

    self.guideLargeText.image=[UIImage imageNamed:guideLargeText];

    self.guideSmallText.image=[UIImage imageNamed:guideSmallText];

    
    [UIView animateWithDuration:0.5 animations:^{
        self.guide.x=offset;
        
        self.guideLargeText.x=offset;
        
        self.guideSmallText.x=offset;
    }];


}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DKGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];



    NSString *str=[NSString stringWithFormat:@"guide%@Background",@(indexPath.row+1)];
    cell.imageIcon=str;
    [cell creatBtnwithIndex:indexPath andCount:4];
    
    return cell;
}



@end
