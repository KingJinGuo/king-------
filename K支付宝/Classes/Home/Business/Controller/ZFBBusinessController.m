//
//  ZFBBusinessController.m
//  口碑
//
//  Created by King on 2017/4/26.
//  Copyright © 2017年 King. All rights reserved.
//
/***
 1.指定类前缀,分文件夹'删除原有Main.sb' 自己创建一个,并别忘指定 Main interface
 2.实现相应的数据源方法
 3.有多少行应该根据数据来
 4.加载plist字典转换模型
 5.在sb中给自带的UITableViewCell指定重用标识 一定要和返回cell的数据源方法是的标识要一样
 6.在SB中给cell添加拖拽相应的控件,并添加约束
 7.创建一个继承至UITableViewCell的类,并且指定SB中的UITableViewCell的class为自己创建出来的这个类
 8.把SB中Cell内部的子控件连线到指定class的.m中的延展中
 9.把模型变成属性定义在自定义cell类的.h中,在.m重写模型属性的set方法在此方法设置数据
 10.打折 把模型中的offNum 改float类型,前提要改一下引入系统框架 UIKit
 11.集成星星,把星星的文件拖拽出来后,指定SB中代表星星的那个View的Class
 12.把用来表示星星view连线在自定义cell.m中,引入星星类的头文件
 13.在模型属性的set方法中,给星星view传level
 
 
 14.创建了一个xib 把xib中的view 宽361 高960
 15.在里面拖入一个imageView并且设置好图片, com + = 自适应下 为了不用改宽高比约束值
 16. 第一个imageView  上  左 右  8间距  + 宽高比
 17. 复制3个imageView 但注意它身上约束
 18. 全部选中左对齐 等宽等高  上下间距8
 19. 创建一个继承 至UIView的类,并且指定class
 20. 把加载xib细节封装在此类中,提供一个可以让外部调用的类方法
 21.给tableView设置tableHeaderView  注意要计算它将来真实的高度
 */

#import "ZFBBusinessController.h"
#import "ZFBBusiness.h"
#import "ZFBBusinessCell.h"
#import "ZFBBusinessPictureView.h"
#import "ZFBBusinessTypeView.h"
#import "ZFBBusinessType.h"

@interface ZFBBusinessController ()
@property (strong, nonatomic)NSArray *businessDate;
@end

@implementation ZFBBusinessController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载数据
    self.businessDate = [self loadBusinessDate];
    
    
    
    
    
    //创建一个新的 view 来包装四张大图
    UIView *headerView = [[UIView alloc] init];
    //创建商家分类界面
    ZFBBusinessTypeView *typeView = [[ZFBBusinessTypeView alloc] initWithFrame:CGRectMake(0, 0, 375, 180)];
    //传数据
    typeView.businessTypeData = [self loadBusinessTypeData];
    //添加 view
    [headerView addSubview:typeView];
    
    //四张大图界面
    //设置 Tableview 的头部文件
    ZFBBusinessPictureView *pictureView = [ZFBBusinessPictureView businessPictureView];
    
    //375 * 960 / 361
    //设置headerview 的真实大小
    CGFloat pictureViewH = self.tableView.bounds.size.width * pictureView.bounds.size.height / pictureView.bounds.size.width;
    pictureView.frame = CGRectMake(0, CGRectGetMaxY(typeView.frame), self.tableView.bounds.size.width, pictureViewH);
    
    [headerView addSubview:pictureView];
    
    //把两个 view 添加到 TableHeaderview
    headerView.frame = CGRectMake(0, 0, 0, CGRectGetMaxY(pictureView.frame));
    
    self.tableView.tableHeaderView = headerView;
    
    
    
    
    
    
    
    
    
    
    
    
    //创建 button  放在 页脚
    UIButton *footBut = [[UIButton alloc] init];
    //设置文字
    [footBut setTitle:@"正在加载中" forState:UIControlStateNormal];
    //设置背景颜色
    [footBut setTitleColor:[UIColor colorWithWhite:0.3 alpha:1] forState:UIControlStateNormal];
    [footBut setTitleColor:[UIColor colorWithWhite:0.7 alpha:1] forState:UIControlStateHighlighted];
    footBut.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1];
    //设置footbut 的位置大小
    footBut.frame = CGRectMake(0, 0, 0, 30);
    //添加到 view 中
    self.tableView.tableFooterView = footBut;
    
    // 让分割线从最左边开始
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.businessDate.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建 cell
    ZFBBusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"business" forIndexPath:indexPath];
    //设置数据
    cell.business = self.businessDate[indexPath.row];
    
    return cell;
}

// 返回每一组的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"  热门推荐";
}

//选中某一行时调用此方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //取消选中  (动画)
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//加载数据
- (NSArray *)loadBusinessDate {

    //加载 plist 文件
    NSArray *dictArr = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"business.plist" withExtension:nil]];
    //创建可变数组  接受模型对象
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    //遍历 字典转数据
    for (NSDictionary *dict in dictArr) {
        [arrM addObject:[ZFBBusiness businessWithDict:dict]];
    }
    //把模型添加到可变数组
    return arrM;
}

//加载商家分类的数据
- (NSArray *)loadBusinessTypeData {
    NSArray *dictArr = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"businessType.plist" withExtension:nil]];
    
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    for (NSDictionary *dict in dictArr) {
        [arrM addObject:[ZFBBusinessType businessTypeWithDict:dict]];
    }
    return arrM.copy;
}



@end
