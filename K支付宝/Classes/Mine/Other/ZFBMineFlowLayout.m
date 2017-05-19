//
//  ZFBMineFlowLayout.m
//  K支付宝
//
//  Created by King on 2017/5/10.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBMineFlowLayout.h"

@implementation ZFBMineFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    //设置组边距
    self.sectionInset = UIEdgeInsetsMake(0, 0, 15, 0);
    //设置最小行间距
    self.minimumLineSpacing = 1;
    //最小列间距
    self.minimumInteritemSpacing = 1;
}

@end
