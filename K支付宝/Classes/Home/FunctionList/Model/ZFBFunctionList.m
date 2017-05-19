//
//  ZFBFunctionList.m
//  功能列表界面
//
//  Created by King on 2017/5/12.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBFunctionList.h"

@implementation ZFBFunctionList

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)functionListWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
