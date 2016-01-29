//
//  FJJudgeViewController.m
//  fit
//
//  Created by Admin on 15/8/5.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "FJJudgeViewController.h"
#import <WebKit/WebKit.h>

@interface FJJudgeViewController ()

@end

@implementation FJJudgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"软件评分";
    self.view.backgroundColor = [UIColor whiteColor];
//    [UIApplication sharedApplication] openURL://

    self.view.backgroundColor =[UIColor whiteColor];
    self.title = @"版本更新";
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/cn/app/id%d",1026469843]]];
    
    // Do any additional setup after loading the view.
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
