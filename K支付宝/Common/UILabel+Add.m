//
//  UILabel+Add.m
//  K朋友圈
//
//  Created by King on 2017/5/2.
//  Copyright © 2017年 King. All rights reserved.
//

#import "UILabel+Add.h"

@implementation UILabel (Add)

+ (UILabel *)makeLableWithTextColor:(UIColor *)textColor andTextFont:(CGFloat)fontsize andContentText:(NSString *)text  {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = [UIColor darkGrayColor];
    label.font = [UIFont systemFontOfSize:13];
    
    return label;
}
@end
