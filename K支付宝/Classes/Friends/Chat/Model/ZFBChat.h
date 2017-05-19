//
//  ZFBChat.h
//  K支付宝
//
//  Created by King on 2017/5/9.
//  Copyright © 2017年 King. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ZFBChatMessageTypeMe,  //  我发的
    ZFBChatMessageTypeOther,   //别人发的
    
} ZFBChatMessageType;

@interface ZFBChat : NSObject
///消息时间
@property (copy, nonatomic) NSString *time;
///消息内容
@property (copy, nonatomic) NSString *text;
///消息类型
@property (nonatomic, assign) NSInteger type;

@end
