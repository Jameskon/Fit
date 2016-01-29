//
//  Settings.m
//  fit
//
//  Created by kai on 15/8/3.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "Settings.h"
#import "FJSetViewController.h"
#import "LC_about.h"


@interface Settings ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tabView;
    
    NSArray * _sectionData;
    
    
}
@end

@implementation Settings

- (void)viewDidLoad {
    [super viewDidLoad];
    _sectionData = @[@"通用设置",@"关于APP"];
    
    _tabView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tabView.dataSource = self;
    _tabView.delegate  = self;
    [self.view addSubview:_tabView];
    
    
}
#pragma mark - =======================UITableViewDataSource and UITableViewDelegate============================

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sectionData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
/*** 配置 cell */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"FJ";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = _sectionData[indexPath.section];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        FJSetViewController * setView = [[FJSetViewController alloc]init];
        setView.hidesBottomBarWhenPushed = YES;
        setView.title = @"通用设置";
        [self.navigationController pushViewController:setView animated:YES];
    }else if (indexPath.section == 1)
    {
        LC_about * about = [[LC_about alloc]init];
        about.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:about animated:YES];
        
    }
    
}



- (void)didReceiveMemoryWarning {
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
