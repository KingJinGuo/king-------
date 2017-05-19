//
//  ZFBCycleView.m
//  图片轮播器
//
//  Created by King on 2017/5/12.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBCycleView.h"
#import "Masonry.h"
#import "ZFBCycleFlowLayout.h"
#import "ZFBCycleCell.h"

@interface ZFBCycleView ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, weak) UIPageControl *pageControl;


@property (nonatomic, weak) NSTimer *timer;

@end
// 图片个数
#define KImageCount  7

// 组数
#define KSectionCount 3
// 定义重用标识
static NSString *cycleCellID = @"cycleCellID";
@implementation ZFBCycleView


-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    // CollectionView
    [self settingCollecitonView];
    
    // 分页指示器
    [self settingPageControl];
    
    // 下面两行代码和上面这个 scheduled方法创建的定时器方法等价
    // timer开头的方法不会自动执行必须手动开始
    NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    //    [timer fire];// 只会走一次
    _timer = timer;
    
    
    
}

// 有数据之后再去设置总页数
- (void)setImageNames:(NSArray *)imageNames {
    _imageNames = imageNames;
    
//设置总页数 有数据了再设置
    _pageControl.numberOfPages = _imageNames.count; // 设置总页数

    
}

// 绘图方法
- (void)drawRect:(CGRect)rect {
    
//    NSLog(@"%@", _collectionView);
    // 在此处滚动时,因为collectionView的自动布局已经计算完成了,有frame所以不用写layoutIfNeeded这个
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:KSectionCount / 2];
    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
}

#pragma mark - 分页指示器
- (void)settingPageControl {
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    
// - 设置总页数 有数据了再设置
    
    pageControl.currentPage = 0;  // 当前显示 第几页
    
    // 当前页点点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor colorWithWhite:0.9 alpha:1];
    // 其它页点点的颜色
    pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:0.6 alpha:1];
    
    [self addSubview:pageControl];
    
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.equalTo(_collectionView.mas_bottom).offset(0);
    }];
    
    _pageControl = pageControl;
}
#pragma mark - collectionView
- (void)settingCollecitonView {
    
    // 0.创建自定义布局对象
    ZFBCycleFlowLayout *layout = [[ZFBCycleFlowLayout alloc] init];
    
    // 1.创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    // 2.设置数据源
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    collectionView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:collectionView];
    
    // 3.给collectionView添加约束
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
    
    // 注册cell
    UINib *cycleNib = [UINib nibWithNibName:@"ZFBCycleCell" bundle:nil];
    [collectionView registerNib:cycleNib forCellWithReuseIdentifier:cycleCellID];
    
    
    
    
    _collectionView = collectionView;
    
    
}





#pragma mark - 定时器每2秒调用一次此方法
- (void)nextPage {
    // 获取当前滚动到第几页
    NSInteger page = self.pageControl.currentPage;
    
    NSIndexPath *indexPath;
    // 如果是最后一张断续向前滚动 滚动到下一组的第0个cell
    if (page == (_imageNames.count - 1)) {
        indexPath =  [NSIndexPath indexPathForItem:0 inSection:KSectionCount / 2 + 1];
        
    } else { // 如果不是最后一张就继续向下一页走
        indexPath =  [NSIndexPath indexPathForItem:page + 1 inSection:KSectionCount / 2];
        
    }
    
    
    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}



// 将要开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    // 让定时器在指定时间再去执行
     // 让定时器在未来去执行
    _timer.fireDate = [NSDate distantFuture];
    
    
    
}

    // 手动拖拽松手就会调用此方法
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    // 让定时器在在两秒之后再去执行
    _timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:2];
    
}




// 手动拖拽并且有降速过程,降速完成之后会调用此方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // 计算滚到第几页 从0开始
    NSInteger page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    // 计算格子是第几组的
    NSInteger section = page / _imageNames.count;
    // 计算格子的item索引
    NSInteger item = page % _imageNames.count;
    
    // 如果当前还在中间这一组滚动就什么也不做
    if (section == KSectionCount / 2) {
        return;
    }
    
    // 5.滚动到中间这一组的第item个cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:KSectionCount / 2];
    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
}

// 代码方法去滚动并且有动画,滚动完一页会调用一此方法
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    
    // 如果不在中间这一组了让它回到中间这一组
    [self scrollViewDidEndDecelerating:scrollView];
}







// 只要在滚动就会调用此方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 计算页数
    NSInteger page = (scrollView.contentOffset.x / scrollView.bounds.size.width + 0.499);
    
    // 设置当前是第几页
    _pageControl.currentPage = page % _imageNames.count;
}








#pragma mark - 数据源方法
// 返回组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return KSectionCount;
}
// 返回格子的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageNames.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.创建cell
    ZFBCycleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cycleCellID forIndexPath:indexPath];
    // 2.设置数据
    cell.indexPath = indexPath;
    // 3.返回cell
    return cell;
}

- (void)dealloc {
//    NSLog(@"%s", __FUNCTION__);
}


// 当一个控件销毁前会先从它的父控件上移除掉,移除并不代表销毁
- (void)removeFromSuperview {
    [super removeFromSuperview];
    NSLog(@"%s", __FUNCTION__);
    
    [_timer invalidate]; // 让定时器作废
    
}
@end

