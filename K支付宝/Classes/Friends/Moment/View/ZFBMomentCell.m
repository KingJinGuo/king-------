//
//  ZFBMomentCell.m
//  K朋友圈
//
//  Created by King on 2017/5/3.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBMomentCell.h"
#import "Masonry.h"
#import "UILabel+Add.h"
#import "UIColor+Addition.h"
#import "ZFBMoment.h"

@interface ZFBMomentCell ()
//头像
@property (nonatomic, weak) UIImageView *iconView;
//昵称
@property (nonatomic, weak) UILabel *nameLabel;
//内容
@property (nonatomic, weak) UILabel *contentText;
//配图
@property (nonatomic, weak) UIImageView *pictureView;
//时间
@property (nonatomic, weak) UILabel *timeLabel;
//删除
@property (nonatomic, weak) UIButton *deleteBtn;

@end

@implementation ZFBMomentCell

//重写父类指定的初始化方法在方法中 创建 子控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
//        self.backgroundColor = [UIColor yellowColor]; 
    }
    return self;
}

- (void)setupUI {
    
    CGFloat magin = 8;
    //1 头像
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:@"user01_icon"];
    [self.contentView addSubview:iconView];
    
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(magin);
        make.top.offset(magin);
        make.width.height.offset(45);
    }];
    //2 昵称
    UILabel *nameLabel = [UILabel makeLableWithTextColor:[UIColor colorWithHex:0x7686a8] andTextFont:15 andContentText:@"超哥"];
    [self.contentView addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(magin);
        make.top.equalTo(iconView.mas_top).offset(0);
    }];
    
    //3 内容
     UILabel *contentText = [UILabel makeLableWithTextColor:[UIColor darkGrayColor ] andTextFont:15 andContentText:@"惊天天气不错呵呵哈哈哈或或哦噢噢噢噢偶爱哦哦哦哦哦哦哦,啦啦啦啦阿里拉拉阿拉啦啦啦啦啦啦啦啦啦"];
    //换行
    contentText.numberOfLines = 0;
    [self.contentView addSubview:contentText];
    
    [contentText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_left).offset(0);
        make.top.equalTo(nameLabel.mas_bottom).offset(magin);
        make.right.offset(-magin);
    }];
    //4 配图
    UIImageView *pictureView = [[UIImageView alloc] init];
    pictureView.image = [UIImage imageNamed:@"pic4"];
    [self.contentView addSubview:pictureView];
    
    [pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentText.mas_left).offset(0);
        make.top.equalTo(contentText.mas_bottom).offset(magin);
//        make.width.height.offset(150);
        //高 小于等于150
        make.height.mas_lessThanOrEqualTo(150);
    }];
    //5 时间
    UILabel *timeLabel = [UILabel makeLableWithTextColor:[UIColor lightGrayColor] andTextFont:13 andContentText:@"刚刚"];
    [self.contentView addSubview:timeLabel];
    
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(pictureView.mas_left).offset(0);
        make.top.equalTo(pictureView.mas_bottom).offset(magin);
        
    }];
    //6 删除按钮
    UIButton *deleteBtn = [[UIButton alloc] init];
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [deleteBtn setTitleColor:[UIColor colorWithHex:0x7686a8] forState:UIControlStateNormal];
    [deleteBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    deleteBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:deleteBtn];
    
    [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(timeLabel.mas_right).offset(magin);
        make.centerY.equalTo(timeLabel.mas_centerY).offset(0);
    }];
    
    //7 评论按钮
    UIButton *commentBtu = [[UIButton alloc] init];
    [commentBtu setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [self.contentView addSubview:commentBtu];
    
    [commentBtu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-magin);
        make.centerY.equalTo(deleteBtn.mas_centerY).offset(0);
        
        //添加约束  计算行高
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-magin);
    }];
    
    _iconView = iconView;
    _nameLabel = nameLabel;
    _contentText = contentText;
    _pictureView = pictureView;
    _timeLabel = timeLabel;
    _deleteBtn = deleteBtn;
}

- (void)setMoment:(ZFBMoment *)moment {
    _moment = moment;
    
    //头像
    _iconView.image = [UIImage imageNamed:moment.icon];
    //昵称
    _nameLabel.text = moment.name;
    //内容
    _contentText.text = moment.contentText;
    //时间
    _timeLabel.text = moment.time;
    
    //配图
    _pictureView.image = [UIImage imageNamed:moment.picture];

    //有配图
    if (moment.picture) {
        //计算配图的 比例
        CGFloat pictureViewW = 150 *_pictureView.image.size.width / _pictureView.image.size.height;
        [_pictureView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.offset(pictureViewW);
            make.top.equalTo(_contentText.mas_bottom).offset(8);
            
        }];
        
    }else {//没有配图
        [_pictureView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.offset(0);
            make.top.equalTo(_contentText.mas_bottom).offset(0);
        }];
        
    }
    
    
    //删除按钮
    _deleteBtn.hidden = !moment.isMine;
}

@end
