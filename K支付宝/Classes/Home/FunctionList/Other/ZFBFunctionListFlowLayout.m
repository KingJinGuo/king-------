//
//  ZFBFunctionListFlowLayout.m
//  功能列表界面
//
//  Created by King on 2017/5/12.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBFunctionListFlowLayout.h"

@implementation ZFBFunctionListFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    //最小 行 列间距
    self.minimumLineSpacing = 1;
    self.minimumInteritemSpacing = 0;
    
    self.sectionInset = UIEdgeInsetsMake(0, 0, 8, 0);
}

@end
