//
//  ZFBHomeTopView.h
//  K支付宝
//
//  Created by King on 2017/5/8.
//  Copyright © 2017年 King. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZFBHomeTopView;
/*
 1.声明协议
 2.声明协议方法
 3.声明代理属性
 **/

typedef enum : NSUInteger {
    ZFBHomeTopViewBtnTypeScan = 1,
    ZFBHomeTopViewBtnTypePay,
    ZFBHomeTopViewBtnTypeCard,
    ZFBHomeTopViewBtnTypeXiu
} ZFBHomeTopViewBtnType;

// 协议命名规范 委托者类名 + Delegate
@protocol ZFBHomeTopViewDelegate <NSObject>
@optional
// 协议方法命名规范  首字母小写
- (void)homeTopView:(ZFBHomeTopView *)topView andClickBtnType:(ZFBHomeTopViewBtnType)btnType;

@end
@interface ZFBHomeTopView : UIView
@property (nonatomic, weak) id <ZFBHomeTopViewDelegate> delegate;
@end
