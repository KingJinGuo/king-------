//
//  ZFBBusinessCell.m
//  口碑
//
//  Created by King on 2017/4/26.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBBusinessCell.h"
#import "ZFBBusiness.h"
#import "ZFBLeverStar.h"

@interface ZFBBusinessCell ()
///店图
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
///店名
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
///评分
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
///人均消费
@property (weak, nonatomic) IBOutlet UILabel *averagePriceLabel;
///距离
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
///优惠信息
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;
///打折
@property (weak, nonatomic) IBOutlet UILabel *offNumLabel;
///星星
@property (weak, nonatomic) IBOutlet ZFBLeverStar *levelStar;

@property (weak, nonatomic) IBOutlet UILabel *jianLable;

@end

@implementation ZFBBusinessCell

//重写 set 方法 在方法中给子控件设置数据
- (void)setBusiness:(ZFBBusiness *)business {
    _business = business;
    
    
    _iconView.image = [UIImage imageNamed:business.icon];
    _nameLabel.text = business.name;
    _levelLabel.text = @(business.level).description;
    _averagePriceLabel.text = [NSString stringWithFormat:@"人均消费是 %@ 元",business.averagePrice];
    _distanceLabel.text = [NSString stringWithFormat:@"距离修正大厦 %@ m",business.distance];
    _offNumLabel.text = [NSString stringWithFormat:@"%@折",@(business.offNum).description];
    
    _discountLabel.text = business.discount;
    _levelStar.levelValue = business.level;
    
    
}


//点击 cell 时 调用此方法
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.jianLable.backgroundColor = [UIColor orangeColor];
}

@end
