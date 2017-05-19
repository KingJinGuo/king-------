//
//  ZFBMomentController.m
//  K朋友圈
//
//  Created by King on 2017/5/1.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBMomentController.h"
#import "ZFBMomentHeaderView.h"
#import "ZFBMoment.h"
#import "ZFBMomentCell.h"

@interface ZFBMomentController ()
///保存所有模型数据
@property (nonatomic, strong) NSArray *momentData;
@end
static NSString *momentCellID = @"momentCellID";
@implementation ZFBMomentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1 设置Tableview 的头文件
    self.tableView.tableHeaderView = [ZFBMomentHeaderView momentHeaderView];
    //调用数据
    [self loadMomentDate];
    
    //指定 class 的方式 注册 cell
    [self.tableView registerClass:[ZFBMomentCell class] forCellReuseIdentifier:momentCellID];
    
//    self.tableView.rowHeight = 300;
    //estimated预估 行高在创建了 cell 后在计算
    self.tableView.estimatedRowHeight = 300;
    //设置行高  让行高自动计算
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}




#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.momentData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建 cell
    ZFBMomentCell *cell = [tableView dequeueReusableCellWithIdentifier:momentCellID forIndexPath:indexPath];
    //设置数据
    cell.moment = _momentData[indexPath.row];
    //返回cell
    return cell;
}




#pragma mark - 加载数据
- (void)loadMomentDate {
 
    NSArray *dictArr = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Moment.plist" withExtension:nil]];
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    for (NSDictionary *dict in dictArr) {
        [arrM addObject:[ZFBMoment momentWithDict:dict]];
    }
    //保存所有模型数据
    _momentData = arrM;
}





@end
