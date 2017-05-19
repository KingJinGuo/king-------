//
//  ZFBBusiness.m
//  口碑
//
//  Created by King on 2017/4/26.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBBusiness.h"

@implementation ZFBBusiness

+ (instancetype)businessWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

@end
