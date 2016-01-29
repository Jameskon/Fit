//
//  FJSetViewController.m
//  fit
//
//  Created by Admin on 15/8/4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "FJSetViewController.h"
#import "FJAttributeViewController.h"


@interface FJSetViewController () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    
    NSArray * _datas;
    
    
    
}
@end

@implementation FJSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _datas = @[@"字体大小",@"字体样式"];
    
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
}
#pragma mark - 组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark - 每组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

#pragma mark - 配置 cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * iD = @"FJ";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iD];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:iD];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = _datas[indexPath.row];
 
    return cell;
}

#pragma mark - 响应 cell 的点击事件

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FJAttributeViewController * attribute = [[FJAttributeViewController alloc]init];
    attribute.title = _datas[indexPath.row];
    attribute.attribute = (FJAttributeStaty)indexPath.row;
    [self.navigationController pushViewController:attribute animated:YES];
}



#pragma mark -






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
