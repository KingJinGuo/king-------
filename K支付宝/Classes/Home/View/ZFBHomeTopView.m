//
//  ZFBHomeTopView.m
//  K支付宝
//
//  Created by King on 2017/5/8.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBHomeTopView.h"
#import "NSAttributedString+Additon.h"
#import "Masonry.h"


@implementation ZFBHomeTopView

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    // 1.扫一扫
    UIButton *scanBtn = [self createHomeTopBtnWithImageName:@"home_scan" andBtnTitle:@"扫一扫" andBtnType:ZFBHomeTopViewBtnTypeScan];
    
    
    // 2.付款
    UIButton *payBtn = [self createHomeTopBtnWithImageName:@"home_pay" andBtnTitle:@"付款" andBtnType:ZFBHomeTopViewBtnTypePay];
    
    // 3.卡券
    UIButton *cardBtn = [self createHomeTopBtnWithImageName:@"home_card" andBtnTitle:@"卡券" andBtnType:ZFBHomeTopViewBtnTypeCard];
    
    // 4.咻一咻
    UIButton *xiuBtn = [self createHomeTopBtnWithImageName:@"home_xiu" andBtnTitle:@"咻一咻" andBtnType:ZFBHomeTopViewBtnTypeXiu];
    
    // 给子控件批处理添加约束 (所有的都设置相同的)
    [self.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        
    }];
    
    // 给水平或垂直多个控件通过设置间距进行等宽或等高
    // 明确间距来动态计算多个控件的宽或高
    [self.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
}
- (UIButton *)createHomeTopBtnWithImageName:(NSString *)imageName andBtnTitle:(NSString *)title andBtnType:(ZFBHomeTopViewBtnType)type {
    // 创建按钮"创建系统样式的按钮"
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    // 创建属性文本,把图片和文字拼接到一起成为"富文本"
    NSAttributedString *attStr = [NSAttributedString imageTextWithImage:[UIImage imageNamed:imageName] imageWH:35 title:title fontSize:15 titleColor:[UIColor whiteColor] spacing:8];
    
    // 设置按钮的属性文本
    [btn setAttributedTitle:attStr forState:UIControlStateNormal];
    // 自动换行
    btn.titleLabel.numberOfLines = 0;
    // 文字居中
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    // 给按钮添加监听方法
    [btn addTarget:self action:@selector(homeTopViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    // 添加到父控件上
    [self addSubview:btn];
    // 给按钮设置标签
    btn.tag = type;
    return btn;
}

//设置监听方法
- (void)homeTopViewBtnClick:(UIButton *)btn {
    
    if ([self.delegate respondsToSelector:@selector(homeTopView:andClickBtnType:)]) {
        
        [self.delegate homeTopView:self andClickBtnType:btn.tag];
    }
}

@end
