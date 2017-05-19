//
//  ZFBCycleFlowLayout.m
//  图片轮播器
//
//  Created by King on 2017/5/12.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBCycleFlowLayout.h"

@implementation ZFBCycleFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    // 让cell和collectionView一样大
    self.itemSize = self.collectionView.bounds.size;
    
    // 设置最小行列间距
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    // 水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 关闭弹簧效果
    self.collectionView.bounces = NO;
    // 隐藏水平垂直滚动条
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    // 分页
    self.collectionView.pagingEnabled = YES;
}


@end
