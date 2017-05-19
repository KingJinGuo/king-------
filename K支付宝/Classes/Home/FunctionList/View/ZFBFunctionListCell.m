//
//  ZFBFunctionListCell.m
//  功能列表界面
//
//  Created by King on 2017/5/13.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBFunctionListCell.h"
#import "ZFBFunctionList.h"

@interface ZFBFunctionListCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ZFBFunctionListCell

- (void)setFunctionList:(ZFBFunctionList *)functionList {
    _functionList = functionList;
    
    self.iconView.image = [UIImage imageNamed:functionList.icon];
    self.nameLabel.text = functionList.name;
}

@end
