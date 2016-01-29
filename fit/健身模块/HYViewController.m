//
//  HYViewController.m
//  fit
//
//  Created by huangyou on 15-8-4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "HYViewController.h"

@interface HYViewController ()

@end

@implementation HYViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    // 宽
    float width = self.view.frame.size.width;
    // 高
    float height = self.view.frame.size.height;
    // 初使化图片视图
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(50, 70, width - 100 , 200)];
    // 加载图片名称
    image.image = [UIImage imageNamed:_imageName];
    // 设置图片显示格式
    image.contentMode = UIViewContentModeScaleAspectFit;
    // 加载图片
    [self.view addSubview:image];
    // 初使化label
    UILabel *label = [[UILabel alloc]init];
    // 设置label为无行数限制
    label.numberOfLines = 0;
    // 加载文本内容
    label.text = _text;
    // 获取文本内容的大小
    CGSize size = [label.text boundingRectWithSize:CGSizeMake(width - 10, 500) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil].size;
    // 设置label的大小
    label.frame = CGRectMake(0,0, width - 10, size.height);
    // 初使化滑动视图
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(5,290, width - 10,height - 290)];
    // 设置滑动的大小
    scrollView.contentSize = CGSizeMake(width - 10, size.height);
    // 关闭垂直滚动条
    scrollView.showsVerticalScrollIndicator = NO;
    // 加载滑动视图
    [self.view addSubview:scrollView];
    // 加载label
    [scrollView addSubview:label];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
