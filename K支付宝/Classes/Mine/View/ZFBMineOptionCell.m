//
//  ZFBMineOptionCell.m
//  K支付宝
//
//  Created by King on 2017/5/10.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBMineOptionCell.h"
#import "ZFBMineOption.h"

@interface ZFBMineOptionCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation ZFBMineOptionCell

- (void)setMineOption:(ZFBMineOption *)mineOption {
    _mineOption = mineOption;
    
    _iconView.image = [UIImage imageNamed:mineOption.icon];
    _messageLabel.text = mineOption.message;
    _nameLabel.text = mineOption.name;
    
    if ([mineOption.message isEqualToString:@"立即转入"]) {
        _messageLabel.textColor = [UIColor blueColor];
    }else {
        _messageLabel.textColor = [UIColor lightGrayColor];
    }
    
}

@end
