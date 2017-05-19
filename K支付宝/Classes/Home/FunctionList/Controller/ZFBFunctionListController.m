//
//  ZFBFunctionListController.m
//  功能列表界面
//
//  Created by King on 2017/5/12.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBFunctionListController.h"
#import "ZFBFunctionListFlowLayout.h"
#import "ZFBFunctionList.h"
#import "ZFBFunctioniAdCell.h"
#import "ZFBFunctionListCell.h"

@interface ZFBFunctionListController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray *functionListData;
@end
// 图片个数
#define KImageCount  5
static NSString *listCellID = @"listCellID";
static NSString *iAdCellID = @"iAdCellID";
@implementation ZFBFunctionListController

// 重写初始化方法给colletionView设置布局对象
- (instancetype)init {
    ZFBFunctionListFlowLayout *flowLayout = [[ZFBFunctionListFlowLayout alloc] init];
    return [super initWithCollectionViewLayout:flowLayout];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    // 注册cell
    UINib *listNib = [UINib nibWithNibName:@"ZFBFunctionListCell" bundle:nil];
    [self.collectionView registerNib:listNib forCellWithReuseIdentifier:listCellID];
    
    UINib *adNib = [UINib nibWithNibName:@"ZFBFunctioniAdCell" bundle:nil];
    [self.collectionView registerNib:adNib forCellWithReuseIdentifier:iAdCellID];
    
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 12;
    }
    
    if (section == 1) {
        return 1;
    }
    
    return self.functionListData.count - 12;
}


// 返回cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 如果 是第1组就返回广告cell
    if (indexPath.section == 1) {
        ZFBFunctioniAdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:iAdCellID forIndexPath:indexPath];
        // 给cell传数据
        cell.imageNames = [self loadImageData];
        return cell;
    }
    
    ZFBFunctionListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:listCellID forIndexPath:indexPath];
    if (indexPath.section == 0) {
        
        cell.functionList = self.functionListData[indexPath.item];
    } else { // 最后一组的数据索引 + 12
        cell.functionList = self.functionListData[indexPath.item + 12];
        
    }
    
    
    return cell;
    
}


// 返回具体每一个格子的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 1) {
        return CGSizeMake(collectionView.bounds.size.width, 100);
    }
    
    
    CGFloat itemW = (collectionView.bounds.size.width - 3) / 4;
    return CGSizeMake(itemW, itemW);
}


#pragma mark - 懒加载 *****
- (NSArray *)functionListData {
    
    if (_functionListData == nil) {
        
        NSArray *dictArr = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"homeAllFunctions.plist" withExtension:nil]];
        
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
        
        for (NSDictionary *dict in dictArr) {
            ZFBFunctionList *func = [ZFBFunctionList functionListWithDict:dict];
            [arrM addObject:func];
        }
        _functionListData = arrM;
    }
    
    return _functionListData;
}


// 加载数据
- (NSArray *)loadImageData {
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:KImageCount];
    for (NSInteger i = 0; i < KImageCount; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%zd", i];
        // 保存图片名称
        [arrM addObject:imageName];
    }
    
    return arrM;
}
@end
