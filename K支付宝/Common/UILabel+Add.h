//
//  UILabel+Add.h
//  K朋友圈
//
//  Created by King on 2017/5/2.
//  Copyright © 2017年 King. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Add)

/**
 创建一个 label

 @param textColor 文字颜色
 @param fontsize 字体大小
 @param text 文字内容
 */
+ (UILabel *)makeLableWithTextColor:(UIColor *)textColor andTextFont:(CGFloat)fontsize andContentText:(NSString *)text;
@end
