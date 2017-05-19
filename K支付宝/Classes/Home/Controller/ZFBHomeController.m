//
//  ZFBHomeController.m
//  K支付宝
//
//  Created by King on 2017/5/7.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBHomeController.h"
#import "ZFBHomeTopView.h"
#import "UIColor+Addition.h"
#import "Masonry.h"
#import "ZFBFunctionListController.h"

@interface ZFBHomeController ()<ZFBHomeTopViewDelegate>

@end

@implementation ZFBHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置顶部的4个  大按钮
    ZFBHomeTopView *topView = [[ZFBHomeTopView alloc] init];
    
    //设置代理
    topView.delegate = self;
    
    topView.backgroundColor = [UIColor colorWithHex:0x2e90d4];
    [self.view addSubview:topView];
    
    //约束
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        //用约束计算比例的高
        make.height.equalTo(topView.mas_width).multipliedBy(115/375.0);
    }];
    
    // 2.功能列表界面
    
    ZFBFunctionListController *functionListVC = [[ZFBFunctionListController alloc] init];
    
    UIView *functionListView = functionListVC.collectionView;
//    functionListView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:functionListView];
    
    [functionListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.top.equalTo(topView.mas_bottom).offset(0);
    }];
    [self addChildViewController:functionListVC];
}

// 实现相应的代理方法
- (void)homeTopView:(ZFBHomeTopView *)topView andClickBtnType:(ZFBHomeTopViewBtnType)btnType {
    switch (btnType) {
        case ZFBHomeTopViewBtnTypeScan:{
            UIViewController *VC = [[UIViewController alloc] init];
            VC.view.backgroundColor = [UIColor yellowColor];
            [self.navigationController pushViewController:VC animated:YES];
            break;
        }
        case ZFBHomeTopViewBtnTypePay:{
            UIViewController *VC = [[UIViewController alloc] init];
            VC.view.backgroundColor = [UIColor orangeColor];
            [self.navigationController pushViewController:VC animated:YES];
            break;
        }
        case ZFBHomeTopViewBtnTypeCard:{
            UIViewController *VC = [[UIViewController alloc] init];
            VC.view.backgroundColor = [UIColor blueColor];
            [self.navigationController pushViewController:VC animated:YES];
            break;
        }
        case ZFBHomeTopViewBtnTypeXiu:{
            UIViewController *VC = [[UIViewController alloc] init];
            VC.view.backgroundColor = [UIColor magentaColor];
            [self.navigationController pushViewController:VC animated:YES];
            break;
        }
            
        default:
            break;
    }
}


@end
