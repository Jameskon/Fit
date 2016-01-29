//
//  KeepFit.m
//  fit
//
//  Created by kai on 15/8/3.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//
#import "HYViewController.h"
#import "HYTableViewCell.h"
#import "KeepFit.h"

@interface KeepFit ()<UITableViewDataSource,UITableViewDelegate>
{
    /**
     *  数据组
     */
    NSMutableArray *_array;
}
@end

@implementation KeepFit
#pragma mark - 开始
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 获取plist中的数据内容
    NSString *path = [[NSBundle mainBundle]pathForResource:@"keepFit.plist"ofType:nil];
    // 解析
    NSArray *pathArray = [NSArray arrayWithContentsOfFile:path];
    // 复制
    _array = [pathArray copy];
    // 设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    // 初使化表视图
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    // 代理
    tableView.delegate = self;
    // 获取数据
    tableView.dataSource = self;
    // 设置如果数据没超过屏幕，表视图不滑动，限制滑动位置
//    tableView.bounces = NO;
    // 加载
    [self.view addSubview:tableView];
}
#pragma mark - 设置组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark - 设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}
#pragma mark - 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
#pragma mark - 设置页眉高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
#pragma mark - 设置页脚的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}
#pragma mark - 设置数据源
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *resert = @"123";
    HYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resert];
    if (!cell)
    {
        cell = [[HYTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:resert];
    }
    // 加载textLabel数据
    cell.textLabel.text = _array[indexPath.row][@"nickname"];
    // 加载detailTextLabel数据
    cell.detailTextLabel.text = _array[indexPath.row][@"briefly"];
    // 加载图片
    cell.imageView.image = [UIImage imageNamed:_array[indexPath.row][@"picturename"]];
    // 返回数据
    return cell;
}
#pragma mark - 跳转界面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 初使化跳转界面
    HYViewController *view = [HYViewController new];
    // 隐藏工具栏
    view.hidesBottomBarWhenPushed = YES;
    // 初使化导航栏的标题
    view.title = _array[indexPath.row][@"nickname"];
    // 初使化跳转界面的文本内容
    view.text = _array[indexPath.row][@"content"];
    // 初使化跳转界面后的图片名称
    view.imageName = _array[indexPath.row][@"bigpicturename"];
    // 跳转界面
    [self.navigationController pushViewController:view animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
