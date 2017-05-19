//
//  ZFBBusinessTypeCell.m
//  商家分类
//
//  Created by King on 2017/5/4.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBBusinessTypeCell.h"
#import "UILabel+Add.h"
#import "Masonry.h"
#import "ZFBBusinessType.h"

@interface ZFBBusinessTypeCell ()
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameLabel;

@end
@implementation ZFBBusinessTypeCell

//重写 指定初始化方法  创建添加子控件
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    //图标
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:@"bus"];
    [self.contentView addSubview:iconView];
    
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.width.height.offset(35);
        make.centerY.offset(-15);
    }];
    //名称
    UILabel *nameLabel = [UILabel makeLableWithTextColor:[UIColor darkGrayColor] andTextFont:13 andContentText:@"物流"];
    [self.contentView addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(15);
        make.centerX.offset(0);
    }];
    _iconView =iconView;
    _nameLabel = nameLabel;
    

}


//重写模型属性的set 方法给cell里的子控件赋值
- (void)setBusinessType:(ZFBBusinessType *)businessType {
    _businessType = businessType;
    
    _iconView.image = [UIImage imageNamed:businessType.icon];
    
    _nameLabel.text = businessType.name;
    
}



@end
