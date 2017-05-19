//
//  ZFBChatController.m
//  K支付宝
//
//  Created by King on 2017/5/9.
//  Copyright © 2017年 King. All rights reserved.
//

#import "ZFBChatController.h"
#import "Masonry.h"
#import "NSArray+Addition.h"
#import "ZFBChatOtherCell.h"
#import "ZFBChatMeCell.h"
#import "ZFBChat.h"

@interface ZFBChatController ()<UITableViewDelegate,UITableViewDataSource>
//保存所有聊天数据
@property (nonatomic, strong) NSArray *chatData;
//保存消息的时间
@property (nonatomic, copy) NSString *previousTime;

@property (nonatomic, weak) UITableView *tableView;
@end
//别人消息的重用标识
static NSString *otherCellID = @"otherCellID";
//自己消息的重用标识
static NSString * meCellID = @"meCellID";
@implementation ZFBChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载数据
    self.chatData = [NSArray objectListWithPlistName:@"Chats.plist" clsName:@"ZFBChat"];
    
    //时间重复 修改
    [self loadChatData];
    
    //聊天数据
    [self settingTableView];
    //底部发消息条
    [self settingBottomBar];
    
    //注册通知监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}

#pragma mark - 收到UIKeyboardWillChangeFrameNotification这个名称的通知会调用此方法
- (void)keyboardWillChangeFrameNotification:(NSNotification *)note {
    //获取系统 中键盘的大小
    
//    NSLog(@"%@",note.userInfo);
    
    CGRect keyboardEndFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    //计算键盘 打开后的 float 的 大小
    CGFloat transformY = keyboardEndFrame.origin.y - (self.view.bounds.size.height + 64) ;
    
    //设置 Tableview 在打开键盘后的大小
    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(transformY);
    }];
//    self.view.transform = CGAffineTransformMakeTranslation(0, -keyboardEndFrame.size.height);
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - 移除通知
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 底部发消息条
- (void)settingBottomBar {
    /*****************底部消息********************/
    
    // 创建效果  模糊效果
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    // 添加聊天界面底部透明视图
    UIVisualEffectView *bottomBarView = [[UIVisualEffectView alloc] initWithEffect:effect];
    
    [self.view addSubview:bottomBarView];
    [bottomBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.bottom.equalTo(_tableView.mas_bottom).offset(0);
        make.height.offset(44);
    }];
    
    //创建 textfield
    UITextField *textField = [[UITextField alloc] init];
    //输入框的模式
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [bottomBarView.contentView addSubview:textField];
    //约束
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(8);
        make.centerY.offset(0);
    }];
    
    // 设置发送键的样式
    textField.returnKeyType = UIReturnKeySend;
    // 让发送键 有内容可以点,没内容不能点
    textField.enablesReturnKeyAutomatically = YES;
    
    //添加发送按钮
    UIButton *send = [UIButton buttonWithType:UIButtonTypeSystem];
    [send setTitle:@"发送" forState:UIControlStateNormal];
    [bottomBarView.contentView addSubview:send];
    [send sizeToFit]; //大小自适应
    
    //设置约束
    [send mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-8);
        make.centerY.offset(0);
        make.left.equalTo(textField.mas_right).offset(8);
        make.width.offset(send.bounds.size.width);
    }];
    
    
}

//聊天数据
- (void)settingTableView {
    //1展示聊天数据 Tableview
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    //设置数据源
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    
    //设置约束
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    //注册别人消息的 cell
    [tableView registerClass:[ZFBChatOtherCell class] forCellReuseIdentifier:otherCellID];
    //注册自己消息的 cell
    [tableView registerClass:[ZFBChatMeCell class] forCellReuseIdentifier:meCellID];
    
    //    tableView.rowHeight = 200;
    tableView.estimatedRowHeight = 100;
    //发消息的聊天框
    
    //设置 Tableview 的背景颜色
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    // 让cell不能选中"它的选中代理方法也不会被调用"
//    tableView.allowsSelection = NO;
    
    // 隐藏分割线
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _tableView = tableView;
    
    // 设置tableView底部多滚动一点
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
    // 让滚动条往上缩44
    tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 44, 0);
    
    // 拖拽tableView就退出键盘
    tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    
}


#pragma mark - 数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.chatData.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZFBChat *chat = _chatData[indexPath.row];
    //创建 cell
    ZFBChatOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:chat.type == ZFBChatMessageTypeOther ? otherCellID : meCellID forIndexPath:indexPath];
    //传递 数据
    cell.chat = self.chatData[indexPath.row];
    //返回 cell
    return cell;
}

//选中某一行时调用此方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //取消选中  (动画)
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 加载数据 去掉聊天时间的重复
- (void)loadChatData {
    //加载数据
    self.chatData = [NSArray objectListWithPlistName:@"Chats.plist" clsName:@"ZFBChat"];
    for (ZFBChat *chat in _chatData) {
        
        //如果时间  相同
        if ([chat.time isEqualToString:self.previousTime]) {
            chat.time = nil;
        }else {
            self.previousTime = chat.time;
        }
    }
}

@end
