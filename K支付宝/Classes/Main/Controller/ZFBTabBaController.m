//
//  ZFBTabBaController.m
//  K支付宝
//
//  Created by King on 2017/5/7.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBTabBaController.h"
#import "UIColor+Addition.h"
#import "ZFBNavigationController.h"

@interface ZFBTabBaController ()

@end

@implementation ZFBTabBaController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建子控制器
    UIViewController *vc1 = [self createChildViewControllerWithClassName:@"ZFBHomeController" andTitle:@"支付宝" andImageName:@"TabBar_HomeBar"];
//    UIViewController *vc2 = [self createChildViewControllerWithClassName:@"ZFBBusinessController" andTitle:@"口碑" andImageName:@"TabBar_Businesses"];
    //口碑控制器的创建用 SB 创建
    UIViewController *vc2 = [self createChildViewControllerWithSBName:@"ZFBBusiness" andTitle:@"口碑" andImageName:@"TabBar_Businesses"];
    UIViewController *vc3 = [self createChildViewControllerWithClassName:@"ZFBFrinedsController" andTitle:@"朋友" andImageName:@"TabBar_Friends"];
    UIViewController *vc4 = [self createChildViewControllerWithClassName:@"ZFBMineController" andTitle:@"我的" andImageName:@"TabBar_Assets"];
    
    //给标签添加子控制器
    self.viewControllers = @[vc1,vc2,vc3,vc4];
    
    //标签栏的文字 颜色  0x2e90d4
    self.tabBar.tintColor = [UIColor colorWithHex:0x2e90d4];
    
    self.tabBar.translucent = NO;
    
    
    //设置开始界面的索引为指定的界面
//    self.selectedIndex = 2;
}


/**
 专为口碑量身定制
 
 @param storyboardName 指定控制器SB
 @param title 标题
 @param imageName 图片
 返回一个导航控制器里面还有一个子控制器
 */
//封装 子控件
- (UIViewController *)createChildViewControllerWithSBName:(NSString *)storyboardName andTitle:(NSString *)title andImageName:(NSString *)imageName {
    //加载 SB文件
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    //加载箭头所指的控制器
    
    UIViewController *vc = [sb instantiateInitialViewController];
    
    
    //名称
    vc.tabBarItem.title = title;
    //图片
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    //拼接图片
    NSString *selImageName = [imageName stringByAppendingString:@"_Sel"];
    
    //设置选中状态的图片,关闭图片的渲染
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //给子控制器 既标签控制器中 嵌套导航标志器
    ZFBNavigationController *nav = [[ZFBNavigationController alloc] initWithRootViewController:vc];
    
    //设置导航标志器的 title
    vc.navigationItem.title = title;
    
    return nav;
}


//封装 子控件
- (UIViewController *)createChildViewControllerWithClassName:(NSString *)className andTitle:(NSString *)title andImageName:(NSString *)imageName {
    //将字符串 转换成 class 类型
    Class class = NSClassFromString(className);
    
    //通过 class 添加相应的 子控制器
    UIViewController *vc = [[class alloc] init];
    //名称
    vc.tabBarItem.title = title;
    //图片
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    //拼接图片
    NSString *selImageName = [imageName stringByAppendingString:@"_Sel"];
    
    //设置选中状态的图片,关闭图片的渲染
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //给子控制器 既标签控制器中 嵌套导航标志器
    ZFBNavigationController *nav = [[ZFBNavigationController alloc] initWithRootViewController:vc];
    
    //设置导航标志器的 title
    vc.navigationItem.title = title;
    
//    vc.view.backgroundColor = [UIColor whiteColor];
    return nav;
}



@end
