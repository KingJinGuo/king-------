//
//  ZFBBusiness.h
//  口碑
//
//  Created by King on 2017/4/26.
//  Copyright © 2017年 King. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFBBusiness : NSObject
///头像
@property (nonatomic, copy)NSString *icon;
///优惠信息
@property (nonatomic,copy) NSString *discount;
///人均消费
@property (nonatomic,strong) NSNumber *averagePrice;
///距离
@property (nonatomic,strong) NSNumber *distance;
///打折
//浮点数 转换成字符串 可能出现问题 所以改为 float
@property (nonatomic,assign) float offNum;
///评分
@property (nonatomic,assign) CGFloat level;
///店名
@property (nonatomic, copy) NSString *name;


+ (instancetype)businessWithDict:(NSDictionary *)dict;
@end
