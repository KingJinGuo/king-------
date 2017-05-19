//
//  ZFBMomentHeaderView.m
//  K朋友圈
//
//  Created by King on 2017/5/1.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBMomentHeaderView.h"
#import "Masonry.h"
#import "UILabel+Add.h"

@implementation ZFBMomentHeaderView

+ (instancetype)momentHeaderView {
    return [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUi];
//        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)setupUi {
    CGFloat margin = 8;
    //1. 现场
    UILabel *sceneLable =  [UILabel makeLableWithTextColor:[UIColor darkGrayColor] andTextFont:15 andContentText:@"现场"];
    
    [self addSubview:sceneLable];
    
    [sceneLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(margin);
        make.top.equalTo(self.mas_top).offset(margin);
    }];
    
    //2. 配图
    UIImageView *pictureView = [[UIImageView alloc] init];
    pictureView.image = [UIImage imageNamed:@"default_nearby_scene"];
    [self addSubview:pictureView];
    
    [pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sceneLable.mas_left).offset(0);
        make.right.offset(-margin);
        make.top.equalTo(sceneLable.mas_bottom).offset(margin);
        make.height.equalTo(pictureView.mas_width).multipliedBy(pictureView.image.size.height / pictureView.image.size.width);
    }];
    
    //3. 朋友状态
    UILabel *friendLable = [UILabel makeLableWithTextColor:[UIColor darkGrayColor] andTextFont:15 andContentText:@"朋友状态"];
    [self addSubview:friendLable];
    
    [friendLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(pictureView.mas_left).offset(0);
        make.top.equalTo(pictureView.mas_bottom).offset(margin);
    }];
    
    //让 frame 根据约束提前运算   尽量少用
    [self layoutIfNeeded];
    
    //4. 计算头部视图的真实高度
     //最大Y 的计算 = frame 的Y +frame 的高
    self.bounds = CGRectMake(0, 0, 0, CGRectGetMaxY(friendLable.frame) + margin);
}



//- (UILabel *)makeLableWithTextColor:(UIColor *)textColor andTextFont:(CGFloat)fontsize andContentText:(NSString *)text  {
//    UILabel *label = [[UILabel alloc] init];
//    label.text = text;
//    label.textColor = [UIColor darkGrayColor];
//    label.font = [UIFont systemFontOfSize:15];
//    
//    return label;
//}

@end
