//
//  LC_about.m
//  微信—ios2班
//
//  Created by 梁超 on 15/8/4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "LC_about.h"
#import "FJVersionViewController.h"
#import "FJFunctionViewController.h"
#import "FJHelpViewController.h"
#import "FJJudgeViewController.h"

@interface LC_about ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray * _datas;
    
}
@end

@implementation LC_about

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于APP";
    _datas = @[@"功能介绍",@"评分"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
   
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableview.bounces = NO;
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    NSLog(@"%f",self.view.frame.size.height);
    
    
    
    [self setLab];
}


#pragma mark - 设置下方文字
- (void)setLab
{
    UILabel *chan = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width, 30)];
    chan.text = @"Copyright (c) 2015年 K.K Studio. All rights reserved.";
    chan.textColor = [UIColor lightGrayColor];
    chan.font = [UIFont systemFontOfSize:13];
    
    chan.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:chan];
    
    UILabel *dataLab = [[UILabel alloc]initWithFrame:CGRectMake(0, chan.frame.origin.y - 20, self.view.frame.size.width, 20)];
    dataLab.text = @"官方 | 论坛 | 咨询";
    dataLab.textColor = [UIColor colorWithRed:0 green:0.6 blue:1 alpha:1];
    dataLab.font = [UIFont systemFontOfSize:14];
    dataLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:dataLab];
    
    
}



#pragma mark 组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}



#pragma mark 头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] init];
    
    CGFloat photoH = self.view.frame.size.height *.17;
    
    UIImageView *photo = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width *.5 - photoH *.5, self.view.frame.size.height *.02, photoH, photoH)];
    photo.image = [UIImage imageNamed:@"fit"];
    photo.contentMode = UIViewContentModeScaleAspectFit;
    photo.layer.cornerRadius = (self.view.frame.size.width *.5 - photoH *.5)/2;
    photo.layer.masksToBounds = YES;
    [headView addSubview:photo];
    
    return headView;
}

#pragma mark - 响应点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController * viewController;
    switch (indexPath.row) {
//        case 0:
//            viewController = [[FJVersionViewController alloc]init];
//            break;
            case 0:
            viewController = [[FJFunctionViewController alloc]init];
            break;
            case 1:
            viewController = [[FJJudgeViewController alloc]init];
            break;
//            case 3:
//            viewController = [[FJHelpViewController alloc]init];
//            break;
    }
  
    [self.navigationController pushViewController:viewController animated:YES];
    
}


#pragma mark 头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.view.frame.size.height *.2;
}


#pragma mark cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"qwer";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
   
    if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = _datas[indexPath.row];
    
    
    
    return cell;
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
