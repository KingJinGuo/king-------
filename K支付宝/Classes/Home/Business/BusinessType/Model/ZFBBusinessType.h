//
//  ZFBBusinessType.h
//  商家分类
//
//  Created by King on 2017/5/4.
//  Copyright © 2017年 King. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFBBusinessType : NSObject
///头像
@property (nonatomic, copy) NSString *icon;
///名称
@property (nonatomic, copy) NSString *name;

+ (instancetype)businessTypeWithDict:(NSDictionary *)dict;

@end
