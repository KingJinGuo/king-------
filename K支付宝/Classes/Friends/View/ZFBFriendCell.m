//
//  ZFBFriendCell.m
//  K支付宝
//
//  Created by King on 2017/5/9.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBFriendCell.h"
#import "ZFBFriend.h"

@interface ZFBFriendCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLable;

@property (weak, nonatomic) IBOutlet UILabel *timeLable;


@end
@implementation ZFBFriendCell

//重写模型属性的 set 方法给子控件设置值
- (void)setFriendData:(ZFBFriend *)friendData {
    _friendData = friendData;
    
    self.iconView.image = [UIImage imageNamed:friendData.icon];
    self.titleLable.text = friendData.title;
    self.subTitleLable.text = friendData.subTitle;
    self.timeLable.text = friendData.time;
}

@end
