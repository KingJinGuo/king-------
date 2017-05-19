//
//  ZFBBusinessPictureView.m
//  口碑
//
//  Created by King on 2017/4/27.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBBusinessPictureView.h"

@implementation ZFBBusinessPictureView

+ (instancetype)businessPictureView {
    
    UINib *nib= [UINib nibWithNibName:@"ZFBBusinessPictureView" bundle:nil];
    return [[nib instantiateWithOwner:nil options:nil] firstObject];
}

@end
