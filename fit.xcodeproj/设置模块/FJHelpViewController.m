//
//  FJHelpViewController.m
//  fit
//
//  Created by Admin on 15/8/5.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "FJHelpViewController.h"

@interface FJHelpViewController ()
{
    NSMutableArray * _btns;
    
    
    /**
     *  物理仿真器
     */
    UIDynamicAnimator * _dynaminc;
    
    
    UIButton * _selectBtn;
    
    
}
@end

@implementation FJHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dynaminc = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    self.title = @"帮助和反馈";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addViewFromBanZhu];
    
    
    // 定时0.3秒后设置btn 的位置
    [NSTimer scheduledTimerWithTimeInterval:0.31 target:self selector:@selector(setBtnFrame) userInfo:nil repeats:NO];
}

#pragma mark - 设置 btn 的位置
- (void)setBtnFrame
{
    NSArray * points = @[@(110),@(170),@(230),@(290),@(350)];
    for (int i = 0  ;i < _btns.count;i ++) {
        UIButton * btn = _btns[i];
        CGPoint p2 = CGPointMake(50, [points[i] floatValue]);
        
        // 使用物理仿真移动位置
            UISnapBehavior * snap = [[UISnapBehavior alloc]initWithItem:btn snapToPoint:p2];
            // 设置震动幅度
            snap.damping = 0.9;
            [_dynaminc addBehavior:snap];
       
    }
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    CGPoint p = [touch locationInView:self.view];
    
    UISnapBehavior * snap = [[UISnapBehavior alloc]initWithItem:_selectBtn snapToPoint:p];
    // 设置震动幅度
    snap.damping = 0.9;
    [_dynaminc removeAllBehaviors];
    [_dynaminc addBehavior:snap];
    
    
    
}

#pragma mark - 添加btn在self.view上
- (void)addViewFromBanZhu
{
    NSArray * titles = @[@"联系我们",@"出现的问题",@"BUG提交",@"常用方法",@"猜猜这是什么"];
    _btns = [NSMutableArray array];
    for (int i = 0; i < titles.count; i ++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(0, 0, 50, 50);
        btn.layer.cornerRadius = 25;
        btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        btn.layer.borderWidth = 1;
        [btn setTitle:titles[i] forState:UIControlStateNormal];
       // 设置btn颜色
        btn.backgroundColor = [UIColor colorWithRed:0 green:0.9 blue:0.9 alpha:1];
        // tag 值
        btn.tag = i + 100;
        // btn的字体大小
        btn.titleLabel.font = [UIFont systemFontOfSize:10];
        // 添加方法
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        // 添加到父视图
        [self.view addSubview:btn];
        
        [_btns addObject:btn];
    }
    
}

- (void)btnClick:(UIButton *)btn
{
    NSLog(@"%d",(int)btn.tag - 100);
    
    for (UIButton *button in _btns) {
        
        button.backgroundColor =  [UIColor colorWithRed:0 green:0.9 blue:0.9 alpha:1];
        
    }
    btn.backgroundColor = [UIColor redColor];
    
    _selectBtn = btn;
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
