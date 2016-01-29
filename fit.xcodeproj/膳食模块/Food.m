//
//  Food.m
//  fit
//
//  Created by kai on 15/8/3.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "Food.h"
#import "NextUIViewController.h"
#import "FoodCell.h"
@interface Food ()
{
    NSMutableArray *shuJu;
}
@end

@implementation Food

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    UITableView *table=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    table.delegate=self;
    table.dataSource=self;
    table.contentInset=UIEdgeInsetsMake(-36, 0, 0, 0);
    table.tag = 300;
    [self.view addSubview:table];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *IDreuse=@"cell";
    FoodCell *cell=[tableView dequeueReusableCellWithIdentifier:IDreuse];
    if (cell==nil) {
        cell=[[FoodCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IDreuse];
    }
    [cell AddDate:(int)indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NextUIViewController *netx=[NextUIViewController new];
    [netx AddDates:(int)indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    netx.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:netx animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UITableView *table = (UITableView *)[self.view viewWithTag:300];
    if (table.contentOffset.y > 1) {
        self.tabBarController.tabBar.hidden = YES;
    }
    else
    {
        self.tabBarController.tabBar.hidden = NO;
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
