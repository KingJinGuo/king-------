//
//  ZFBNavigationController.m
//  K支付宝
//
//  Created by King on 2017/5/7.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBNavigationController.h"
#import "UIColor+Addition.h"

@interface ZFBNavigationController ()

@end

@implementation ZFBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //NSFontAttributeName 一个字符串常量用来当字典的key
    //NSForegroundColorAttributeName 字体的颜色
    self.navigationBar.titleTextAttributes = @{
                    // 字体大小
                    NSFontAttributeName : [UIFont systemFontOfSize:17],
                    //字体颜色
                    NSForegroundColorAttributeName : [UIColor whiteColor]
                    };
    
    
    //去掉 导航条分割线  (默认情况下是存在分割线)
    //要去掉分割线  就要创建一个透明的线
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航条的背景颜色
    self.navigationBar.barTintColor = [UIColor colorWithHex:0x2e90d4];
    // 让导航条没有半透明效果,会影响子控制器view的尺寸"会让它从导航条下面开始高度少了64"
    self.navigationBar.translucent = NO;
    
    //设置导航条返回按钮的颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
    
}

// 设置状态栏的样式
//#warning - 如果有了导航控制器之后状态栏样 SB 的设置权限默认是在导航控制器做批处理操作
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

//??  重写 父类方法 拦截 push 方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //判断子控制器的个数
    if (self.childViewControllers.count > 0) {
        //设置导航控制器根控制器以外的所有子控制器的此属性是YES
        // 除了导航控制器中的根控制器不隐藏下面的标签栏,其它子控制器全部都要隐藏下面的标签栏
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //push实现还做了添加子控制器的操作
    [super pushViewController:viewController animated:animated];
}


@end
