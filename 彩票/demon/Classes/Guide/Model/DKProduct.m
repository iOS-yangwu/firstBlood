//
//  DKProduct.m
//  demon
//
//  Created by 吴洋 on 15/11/26.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKProduct.h"

@implementation DKProduct

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        self.title=dict[@"title"];
        self.ID=dict[@"id"];
        self.url=dict[@"url"];
        self.icon=dict[@"icon"];
        self.customUrl=dict[@"customUrl"];
        
    }

    return self;
    

}




+ (instancetype)productWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];


}
@end
