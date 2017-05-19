//
//  ZFBMomentCell.h
//  K朋友圈
//
//  Created by King on 2017/5/3.
//  Copyright © 2017年 King. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZFBMoment;
@interface ZFBMomentCell : UITableViewCell
/// 接收数据的数据模型
@property (nonatomic, strong) ZFBMoment *moment;
@end
