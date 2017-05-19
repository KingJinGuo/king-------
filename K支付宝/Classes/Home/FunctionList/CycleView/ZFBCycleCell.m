//
//  ZFBCycleCell.m
//  图片轮播器
//
//  Created by King on 2017/5/12.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBCycleCell.h"

@interface ZFBCycleCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ZFBCycleCell

- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    
    
    self.imageView.image = [UIImage imageNamed:@(indexPath.item).description];
}
@end
