//
//  ZFBFunctionList.h
//  功能列表界面
//
//  Created by King on 2017/5/12.
//  Copyright © 2017年 King. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFBFunctionList : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;

+ (instancetype)functionListWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
