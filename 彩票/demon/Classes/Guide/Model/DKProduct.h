//
//  DKProduct.h
//  demon
//
//  Created by 吴洋 on 15/11/26.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DKProduct : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *ID;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *customUrl;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)productWithDict:(NSDictionary *)dict;



@end
