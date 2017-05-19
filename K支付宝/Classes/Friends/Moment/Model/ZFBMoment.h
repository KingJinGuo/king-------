//
//  ZFBMoment.h
//  K朋友圈
//
//  Created by King on 2017/5/2.
//  Copyright © 2017年 King. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFBMoment : NSObject
///头像
@property (nonatomic, copy)NSString *icon;
///昵称
@property (nonatomic, copy)NSString *name;
///内容
@property (nonatomic, copy)NSString *contentText;
///图片
@property (nonatomic, copy)NSString *picture;
///时间
@property (nonatomic, copy)NSString *time;
///是不是自己的状态
@property (nonatomic, assign, getter=isMine) BOOL mine;

+ (instancetype)momentWithDict:(NSDictionary *)dict;

@end
