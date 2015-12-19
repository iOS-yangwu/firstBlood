//
//  DKProductVc.m
//  demon
//
//  Created by 吴洋 on 15/11/26.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKProductVc.h"
#import "DKSettingProductCell.h"
#import "DKProduct.h"

@interface DKProductVc ()

@property(nonatomic,strong)NSArray *products;


@end

@implementation DKProductVc


-(NSArray *)products{
    if (_products==nil) {
        
        NSString *path=[[NSBundle mainBundle]pathForResource:@"more_project.json" ofType:nil];
        
        NSData *jsonData=[NSData dataWithContentsOfFile:path];
        
        NSArray *array=[NSJSONSerialization JSONObjectWithData:jsonData options:                                                        NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *arrM=[NSMutableArray array];
        
        for (NSDictionary *dict in array) {
            
            [arrM addObject:[DKProduct productWithDict:dict]];
            
        }
        _products=arrM;
        
    }

    return _products;
}

static NSString *ID=@"product_cell";

- (instancetype)init{
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];

    
    layout.minimumLineSpacing=20;
    
    layout.itemSize=CGSizeMake(80, 80);
    
    layout.minimumInteritemSpacing=0;
    
    

    return [super initWithCollectionViewLayout:layout];
    

}

+ (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{

    return [super init];

}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.collectionView.backgroundColor=[UIColor whiteColor];
    
    self.collectionView.contentInset=UIEdgeInsetsMake(20, 0, 0, 0);
 
    UINib *nib=[UINib nibWithNibName:@"DKSettingProductCell" bundle:nil];
    
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:ID];
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];

    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.products.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {


    DKSettingProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    DKProduct *product=self.products[indexPath.row];
//    设置数据
    cell.product=product;

    
    return cell;
}


@end
