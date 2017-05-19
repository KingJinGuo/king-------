//
//  ZFBBusinessType.m
//  商家分类
//
//  Created by King on 2017/5/4.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBBusinessType.h"

@implementation ZFBBusinessType

+ (instancetype)businessTypeWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

@end
