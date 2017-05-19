//
//  ZFBMoment.m
//  K朋友圈
//
//  Created by King on 2017/5/2.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBMoment.h"

@implementation ZFBMoment

+ (instancetype)momentWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}
@end
