//
//  ZFBBusinessTypeView.m
//  商家分类
//
//  Created by King on 2017/5/4.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBBusinessTypeView.h"
#import "ZFBBusinessType.h"
#import "ZFBBusinessTypeFlowLayout.h"
#import "Masonry.h"
#import "ZFBBusinessTypeCell.h"

@interface ZFBBusinessTypeView ()<UICollectionViewDataSource,UICollectionViewDelegate>
//collectionView 保存
@property (nonatomic, strong) UICollectionView *collectionView;
//分页指示器
@property (nonatomic, strong) UIPageControl *pageControl;

@end
//重用表示符
static NSString *businessTypeCellID = @"businessTypeCellID";
@implementation ZFBBusinessTypeView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    //添加 collectionView
    [self makeCollectionView];
    //添加分页指示器
    [self makePageControl];
}

#pragma make -添加分页指示器
- (void)makePageControl {
    //创建分页指示器
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    //设置当前总页数
    pageControl.numberOfPages = 2;
    //设置当前页
    pageControl.currentPage = 0;
    
    //设置当前页的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor darkGrayColor];
    //设置其他页得颜色
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    
    [self addSubview:pageControl];
    //设置约束
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(_collectionView.mas_bottom).offset(-10);
    }];
    //关闭点击效果
    pageControl.enabled = NO;
    _pageControl = pageControl;
}

#pragma mark - 添加 collectionView
- (void)makeCollectionView {
    //创建 自定义流布局
    ZFBBusinessTypeFlowLayout *flowLayout = [[ZFBBusinessTypeFlowLayout alloc] init];
    
    //创建 collectionview
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    
    //设置数据源
    collectionView.dataSource = self;
    collectionView.delegate  = self;
    //添加到父控件上
    [self addSubview:collectionView];
    
    //添加约束
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.offset(150);
    }];
    
    //设置collectionview 的背景颜色
    collectionView.backgroundColor = [UIColor whiteColor];
    
    //注册 cell
    [collectionView registerClass:[ZFBBusinessTypeCell class] forCellWithReuseIdentifier:businessTypeCellID];
    
    _collectionView = collectionView;
    
}

//只要在滚动中  都会调用此方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //当前所在的位置
    NSInteger page = scrollView.contentOffset.x/self.collectionView.bounds.size.width ;
    
    //    NSLog(@"%f---%zd",scrollView.contentOffset.x,page);
    
    self.pageControl.currentPage = page;
}


#pragma mark - 数据源方法
//返回的格子数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.businessTypeData.count;
}

//返回每一个格子
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //创建 cell
    ZFBBusinessTypeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:businessTypeCellID forIndexPath:indexPath];
    //设置数据
    cell.businessType = self.businessTypeData[indexPath.item];
    //返回 cell
    return cell;
}

@end
