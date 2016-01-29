//
//  FJVersionViewController.m
//  fit
//
//  Created by Admin on 15/8/5.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "FJVersionViewController.h"

@interface FJVersionViewController ()<UIWebViewDelegate>
{
    UIWebView * _webView;
}
@end

@implementation FJVersionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.title = @"版本更新";
    
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    
}

@end

