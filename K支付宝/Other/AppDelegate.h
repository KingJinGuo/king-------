//
//  AppDelegate.h
//  K支付宝
//
//  Created by King on 2017/5/7.
//  Copyright © 2017年 King. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end
/**
 1.创建一个新的UIView用来表示口碑 的头部视图,把商家分类及四张大图的view装到这个view
 2.选测试之前写的商家分类运行是否正常,把商家分类的businessType文件拖拽到支付宝项目的business文件下,把商家分类的图片素材也拖过来
 3.把商家分类创建的代码copy到口碑控制器中,还有数据加载的方法也copy过来
 4.把商家分类添加到headerView上,把四张大图的view也添加到headerView上
 5.注意四张大图view 它的 Y 及宽度的问题
 6.计算haderView的真实高度 "X,Y,宽可以不用设置但高必须自己设置" 高度是取四张大图的最大Y
 
 ******************* 以下朋友界面   ***************
 1.把朋友控制器继承改为UITableViewController
 2.在朋友控制器重写父类指定初始化方法 在里面super时自己指定样式,不要用默认传过来的
 
 3.拖入 NSObject 及NSArray分类 ,在模型的.h文件中只用定义模型属性即可,不用再写字典转模型的实现方法
 4.在朋友控制器引入NSArray用来字典转模型的分类头文件 直接调用方法进行字典转模型,注意plist文件及模型的类名不要写错
 5.表格分2组 第1组有多少行用模型的个数表示
 6.在返回cell的方法中进行判断返回两种不同的cell,前题是要提前注册两种cell 重用标识不要写错了
 7.自定义第一组的cell 创建一个继承至UITableViewCell的类的时候勾选 also create xib选项,会帮我们创建下xib
 8.第一组的cell用xib的方式去注册
 
 
 9.给xib中的cell拖拽四个子控件并且添加约束 "都用了个垂直居中"
 10.把子控件连线到管理xib类的.m中
 11.引入模型属性,重用set方法给xib中的四个子控件设置数据, 在返回cell的数据源方法中传递模型
 12.分割线从最左边开始,取消选中效果,第0组cell的顶部间距问题"返回每一组头部高度的代理 方法返回0无效,返回0.1就好"
 
 
 
 1.把原本的生活圈项目进行测试OK?
 2.把原本生活圈项目中的Moment文件拖拽到支付宝的Friends文件夹下,com + B
 3.拖拽生活圈的图片素材
 4.在朋友控制器中实现选中某行cell的代理 方法,在里面判断选中第0组cell时跳转生活圈控制器
 5.用代码创建生活圈控制器,push
 6.设置生活圈界面导航条上的标题,生活圈底部标签的隐藏
 7.在自定义导航控制器中 重写push方法,不要少了super
 8.把设置标签栏隐藏的代码要写在真正push前面 还要加上判断,除了根控制器以外的控制器才设置隐藏属性为YES
 9.处理生活圈界面的细节,取消选中cell"cell能不能选中,以及选中无样式"
 
 
 
 
 
 1.把本地的copy文件复制到朋友文件夹中改为Chat,然后再把此文件拖入项目中
 2.创建一个普通控制器类,然后在ZFBFriendsController选中第1组中的第2行cell时跳转到聊天界面去
 3.把聊天界面控制器直接设置为窗口的根控制器,方便测试
 4.创建及添加tableView
 5.展示聊天数据  字典转模型 拖入素材
 6.用Class的方式自定义cell,
 
 
 */

