//
//  ZFBLeverStar.m
//  星级评价
//
//  Created by King on 2017/4/26.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBLeverStar.h"

@implementation ZFBLeverStar

//??
// 当一个视图从xib或sb中创建完成之后就会调用此方法
- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 来了直接把5个imageView创建添加好
    for (NSInteger i = 0; i < 5; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"empty_star"]];
        CGFloat imageViewX = i * imageView.image.size.width;
        imageView.frame = CGRectMake(imageViewX, 0, imageView.image.size.width, imageView.image.size.height);
        [self addSubview:imageView];
    }
}



//此方法只有 代码创建时 才会调用
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        //直接创建 5个imageview 添加好
        for (NSInteger i = 0; i <5; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"empty_star"]];
            CGFloat imageViewX = i * imageView.image.size.width;
            imageView.frame = CGRectMake(imageViewX, 0, imageView.image.size.width, imageView.image.size.height);
            [self addSubview:imageView];
        }
    }
    return self;
    
}


- (void)setLevelValue:(CGFloat)levelValue {
    _levelValue = levelValue;
    
    //满星的 个数
    NSInteger fullStarCount = (NSInteger)levelValue;
    for ( NSInteger i = 0; i < fullStarCount; i++) {
        [self makeLevelStarWithImageName:@"full_star" andPosition:i];
    }
    //半星
    if (levelValue - fullStarCount) {
        [self makeLevelStarWithImageName:@"half_star" andPosition:fullStarCount];
        fullStarCount ++;
    }
    //空星
    for (NSInteger i = fullStarCount; i < 5; i++) {
        [self makeLevelStarWithImageName:@"empty_star" andPosition:i];
    }
}

- (void)makeLevelStarWithImageName:(NSString *)imageName andPosition:(NSInteger)postion {
    //获取相应位置的子控件
    UIImageView *imageView = self.subviews[postion];
    //设置图片
    imageView.image = [UIImage imageNamed:imageName];
    
}

//    //创建 imageview 设置图片
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
//
//    //计算 图片的 x
//    CGFloat imageViewX = postion * imageView.image.size.width;
//    imageView.frame = CGRectMake(imageViewX, 0, imageView.image.size.width, imageView.image.size.height);
//
//    //添加到父控件上
//    [self addSubview:imageView];
@end
