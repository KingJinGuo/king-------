//
//  ZFBFrinedsController.m
//  K支付宝
//
//  Created by King on 2017/5/7.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBFrinedsController.h"
#import "ZFBFriendCell.h"
#import "ZFBFriend.h"
#import "NSArray+Addition.h"
#import "ZFBMomentController.h"
#import "ZFBChatController.h"

@interface ZFBFrinedsController ()
@property (strong, nonatomic) NSArray *friendsData;
@end

//第0组 cell 的重用标示符
static NSString *ZFBMomentCellID = @"ZFBMomentCellID";
//第1组 cell 的重用标示符
static NSString *ZFBFriendCellID = @"ZFBFriendCellID";

@implementation ZFBFrinedsController

//重写指定的初始化 方法修改 Tableview 的样式
- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载好友数据
    self.friendsData = [NSArray objectListWithPlistName:@"Friends.plist" clsName:@"ZFBFriend"];
    //注册第0组的 cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ZFBMomentCellID];
    
    //注册第1组的 cell
    //加载 xib 文件
    UINib *nib = [UINib nibWithNibName:@"ZFBFriendCell" bundle:nil];
    //用 xib 方式注册 cell
    [self.tableView registerNib:nib forCellReuseIdentifier:ZFBFriendCellID];
    //设置统一行高
    self.tableView.rowHeight = 60;
    
}

#pragma mark - 数据源方法
//返回组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//返回行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section ==0) {
        return 1;
    }
    //返回第一组行数
    return self.friendsData.count;
}

//返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //返回不同样式的 sell
    if (indexPath.section == 0) {
        UITableViewCell *momentCell = [tableView dequeueReusableCellWithIdentifier:ZFBMomentCellID forIndexPath:indexPath];
        momentCell.textLabel.text = @"朋友圈";
        momentCell.imageView.image = [UIImage imageNamed:@"APC_timeLineIcon"];
//        设置 cell 的辅助视图 (>)
        momentCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return momentCell;
        
    }
    ZFBFriendCell *friendCell = [tableView dequeueReusableCellWithIdentifier:ZFBFriendCellID forIndexPath:indexPath];
    
    //给cell 设置数据
    friendCell.friendData = self.friendsData[indexPath.row];
    
    return friendCell;
}

//选中一行时调用此方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        //创建生活圈控制器
        ZFBMomentController *momentVC = [[ZFBMomentController alloc] init];
        //设置导航蓝标题
        momentVC.title = @"生活圈";
        
        [self.navigationController pushViewController:momentVC animated:YES];
        
    }
    
    if (indexPath.row == 2) {
        //跳转到聊天界面
        ZFBChatController *chatVC = [[ZFBChatController alloc] init];
        [self.navigationController pushViewController:chatVC animated:YES];
    }
}

// 返回每一组的头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    // 设置0无效
    return 0.01;
}



@end
