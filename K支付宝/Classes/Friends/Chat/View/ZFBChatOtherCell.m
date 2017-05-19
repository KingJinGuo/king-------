//
//  ZFBChatOtherCell.m
//  K支付宝
//
//  Created by King on 2017/5/9.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBChatOtherCell.h"
#import "UILabel+Add.h"
#import "Masonry.h"
#import "ZFBChat.h"

@interface ZFBChatOtherCell ()
@property (nonatomic, weak)UILabel *timeLabel;
@property (nonatomic, weak)UILabel *messageLabel;

@end

@implementation ZFBChatOtherCell


//重写父类指定的初始化方法   创建子控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    return self;
}


//创建添加子控件
- (void)setupUI {
    
    
    CGFloat margin = 8;
    //时间
    UILabel *timeLabel = [UILabel makeLableWithTextColor:[UIColor lightGrayColor] andTextFont:13 andContentText:@"12:12"];
    [self.contentView addSubview:timeLabel];
    
    //约束
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.centerX.offset(0);
    }];
    
    //头像
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:@"other"];
    [self.contentView addSubview:iconView];
    
    //约束
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(50);
        make.left.offset(margin);
        make.top.equalTo(timeLabel.mas_bottom).offset(0);
    }];
    
    //聊天图片
    UIImageView *backImageView = [[UIImageView alloc] init];
    backImageView.image = [UIImage imageNamed:@"Dialog_white.left"];
    [self.contentView addSubview:backImageView];
    
    //约束
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(margin);
        make.top.equalTo(iconView.mas_top).offset(0);
    }];
    
    //消息文字
    UILabel *messageLabel = [UILabel makeLableWithTextColor:[UIColor darkGrayColor] andTextFont:16 andContentText:@"发顺丰多合计收到回复 UI奥斯卡的表姐夫为个人版啊虽然话剧UI结婚后戴副眼镜刚不烦得很敬爱个就好了 UI而比较不会分求额呵呵说了卡等级分类看见看见我为我就开了房间爱老是肯德基"];
    //让 label 自动换行
    messageLabel.numberOfLines = 0;
    [self.contentView addSubview:messageLabel];
    
    //约束
    [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(backImageView).mas_offset(UIEdgeInsetsMake(margin, margin*2, margin, margin));
//        make.width.offset(200);
        
        //如果 消息宽度大于200 就用200, 如果小于200 就自适应自己的宽度
        make.width.mas_lessThanOrEqualTo(200);
    }];
    
    //cell 的宽高  设置
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        //contentview距离四周的距离0
        make.edges.offset(0);
        
        //谁高要谁
        make.bottom.mas_greaterThanOrEqualTo(iconView.mas_bottom).offset(margin);
        make.bottom.mas_greaterThanOrEqualTo(backImageView.mas_bottom).offset(margin);
    }];

    _timeLabel = timeLabel;
    _messageLabel = messageLabel;
}

//重写模型属性 set 方法
- (void)setChat:(ZFBChat *)chat {
    _chat = chat;

    _timeLabel.text = chat.time;
    _messageLabel.text = chat.text;
    
    
    
    
}



@end
