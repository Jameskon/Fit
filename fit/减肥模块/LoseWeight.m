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
    [self.view addSubview:loseTabView];
    loseTabView.dataSource=self;
    loseTabView.delegate=self;
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
    return 80;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  static  NSString *ss=@"hello word";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ss];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:3 reuseIdentifier:ss];
    }
    NSDictionary *dict = loseData[indexPath.row];
    cell.imageView.image=[UIImage imageNamed:[dict valueForKey:@"image1"]];
    cell.textLabel.text=[dict valueForKey:@"headLab"];
    cell.detailTextLabel.text= [dict valueForKey:@"birefLab"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    loseCenton *view=[[loseCenton alloc]init];
    [self.navigationController pushViewController:view animated:YES];
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
