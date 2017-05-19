//
//  ZFBMineController.m
//  K支付宝
//
//  Created by King on 2017/5/7.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBMineController.h"
#import "ZFBMineFlowLayout.h"
#import "ZFBMineInfoCell.h"
#import "ZFBMineOptionCell.h"
#import "ZFBMineBalanceCell.h"
#import "NSArray+Addition.h"
#import "ZFBMineOption.h"


@interface ZFBMineController ()<UICollectionViewDelegateFlowLayout>
//保存所用模型数据
@property (nonatomic, strong) NSArray *mineOptionData;

@end
//定义重复标识
static NSString *infoCellID = @"infoCellID";
static NSString *balanceCellID = @"balanceCellID";
static NSString *optionCellID = @"optionCellID";

@implementation ZFBMineController
/**
 1.我的控制器更改继承 collectionViewController
 2.重写init方法 [super initWithCollectionViewLayout:layout]"传入自定义布局"
 3.使用UICollectionViewDelegateFlowLayout计算三种cell的尺寸
 4.xib方式自定义cell  注册3个cell
 
 返回有多少组(4)
 某一组有多少行(1, 5, 4, 6)
 cell内容(0组'info' , 1组0行'balance' , 其他'option')
 
 注意取模型数组中的数据  item在新的一组会从0开始 所以在下一组时要进行累加索引
 */

- (instancetype)init {
    //创建布局 对象
    ZFBMineFlowLayout *flowLayout = [[ZFBMineFlowLayout alloc] init];
    return [super initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置 collectView 的背景颜色
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    //加载数据
    _mineOptionData = [NSArray objectListWithPlistName:@"MineOption.plist" clsName:@"ZFBMineOption"];
    
    UINib *infoNib = [UINib nibWithNibName:@"ZFBMineInfoCell" bundle:nil];
    [self.collectionView registerNib:infoNib forCellWithReuseIdentifier:infoCellID];
    
    UINib *balanceNib = [UINib nibWithNibName:@"ZFBMineBalanceCell" bundle:nil];
    [self.collectionView registerNib:balanceNib forCellWithReuseIdentifier:balanceCellID];
    
    UINib *optionNib = [UINib nibWithNibName:@"ZFBMineOptionCell" bundle:nil];
    [self.collectionView registerNib:optionNib forCellWithReuseIdentifier:optionCellID];
}

#pragma  mark - 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        
        
        return 1;
    }
    if (section == 1) {
        return 5;
    }
    if (section == 2) {
        return 4;
    }
    return 6;
}
//返回 cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section ==0 ) {
        //如果是第0组 返回 infocell
        ZFBMineInfoCell *infoCell = [collectionView dequeueReusableCellWithReuseIdentifier:infoCellID forIndexPath:indexPath];
        return infoCell;
    }
    //如果 是第1组的第0个返回 balancecell
    if (indexPath.section == 1 &&indexPath.item == 0) {
        ZFBMineBalanceCell *balanceCell = [collectionView dequeueReusableCellWithReuseIdentifier:balanceCellID forIndexPath:indexPath];
        return balanceCell;
    }
    
    ZFBMineOptionCell *optionCell = [collectionView dequeueReusableCellWithReuseIdentifier:optionCellID forIndexPath:indexPath];
    
    ZFBMineOption *mineOption;
    //如果是第一组中的 及以后 的cell
    if (indexPath.section == 1 ) {
        mineOption = self.mineOptionData[indexPath.item - 1];
    }else if (indexPath.section == 2) {
        mineOption = self.mineOptionData[indexPath.item + 4];
        
    }else {
        mineOption = self.mineOptionData[indexPath.item + 8];

    }
    
    optionCell.mineOption = mineOption;
    
    return optionCell;
    
}


//返回 每一个格子的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section ==0 ) {
        return CGSizeMake(collectionView.bounds.size.width, 100);
        
    }
    //如果 是第1组的第0个返回 balancecell
    if (indexPath.section == 1 &&indexPath.item == 0) {
        
        return CGSizeMake(collectionView.bounds.size.width, 60);
    }
    CGFloat itemW = (collectionView.bounds.size.width - 1) *0.5;
    
    return CGSizeMake(itemW, 60);
}

@end
