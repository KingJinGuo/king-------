//
//  ZFBFunctioniAdCell.m
//  功能列表界面
//
//  Created by King on 2017/5/13.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBFunctioniAdCell.h"
#import "ZFBCycleView.h"

@interface ZFBFunctioniAdCell ()
@property (weak, nonatomic) IBOutlet ZFBCycleView *cycleView;



@end

@implementation ZFBFunctioniAdCell

// 当我这个广告cell拿到数据之后再给里面的图片轮播器全部传过去
- (void)setImageNames:(NSArray *)imageNames {
    _imageNames = imageNames;
    
    // 给图片轮播器传图片
    _cycleView.imageNames = imageNames;
}

@end
