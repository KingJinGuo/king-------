//
//  ZFBBusinessTypeFlowLayout.m
//  商家分类
//
//  Created by King on 2017/5/4.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBBusinessTypeFlowLayout.h"

#define CellColCount 4 //列数
#define CellRowCount 2 //行数
@implementation ZFBBusinessTypeFlowLayout

//准备布局"当collectionView马上要显示出来的时候会调用此方法,得到itemSize及行列间距" reloadData"刷新数据时,此方法也会重新执行
- (void)prepareLayout {
    [super prepareLayout];
    
    CGSize collectionViewSize = self.collectionView.bounds.size;
    //设置 cell 的尺寸
    CGFloat cellW = collectionViewSize.width / CellColCount;
    CGFloat cellH = collectionViewSize.height / CellRowCount;
    self.itemSize = CGSizeMake(cellW, cellH);
    //  cell 最小行间距
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    //滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //开启分页
    self.collectionView.pagingEnabled = YES;
    
    //关闭弹簧
    self.collectionView.bounces = NO;
    
    //隐藏滚动栏
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    
}

@end
