//
//  LoseWeight.m
//  fit
//
//  Created by kai on 15/8/3.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "LoseWeight.h"
#import "loseDates.h"
#import "loseCenton.h"
#import "loseTableViewCell.h"
#define W self.view.frame.size.width
#define H self.view.frame.size.height

@interface LoseWeight ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *loseData;
    UIImageView *imageView;
}
@end

@implementation LoseWeight

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    UITableView *loseTabView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    loseTabView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    ;
    loseTabView.tag = 100;
    [self.view addSubview:loseTabView];
//    loseTabView.scrollEnabled = NO;
    loseTabView.dataSource=self;
    loseTabView.delegate=self;
//    loseTabView.backgroundColor = [UIColor colorWithRed:239/255 green:239/255 blue:244/255 alpha:1];
    loseTabView.backgroundColor = [UIColor colorWithWhite:.95 alpha:1];
    
    loseData=[NSMutableArray array];
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"loseWeight" ofType:@"plist"];
    
    NSArray *arr=[NSArray arrayWithContentsOfFile:path];
    
    for(NSDictionary *dict in arr){
        
        loseDates *date=[[loseDates alloc]initWithAttribte:dict];
        
        [loseData addObject:date];
        
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return loseData.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static  NSString *ss=@"hello word";
    
    loseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ss];
    
    if(!cell){
        
        cell=[[loseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ss];
    }
    
    loseDates *data=[loseData objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setDataModel:data];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    loseCenton *view=[[loseCenton alloc]init];
    
    loseDates *data = [loseData objectAtIndex:indexPath.row];
    NSString *str = data.centonLab;
    NSString *imageName = data.image2;
    view.imaegname = ^()
    {
        return imageName;
    };
    view.r = ^()
    {
        return str;
    };
    [self showdata:str];
    view.hidesBottomBarWhenPushed =YES;
    [self.navigationController pushViewController:view animated:YES];
}

-(NSString *)showdata:(NSString *)str
{
    return str;
}


#pragma mark - 设置页脚的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UITableView *table = (UITableView *)[self.view viewWithTag:100];
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
