//
//  FJFunctionViewController.m
//  fit
//
//  Created by Admin on 15/8/5.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "FJFunctionViewController.h"

@interface FJFunctionViewController ()

@end

@implementation FJFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"功能介绍";
    
    NSError * error;
    NSString * path = [[NSBundle mainBundle] pathForResource:@"Function.txt" ofType:nil];
    NSString * text = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];

    UITextView * textView = [[UITextView alloc]initWithFrame:self.view.bounds];
    textView.text = text;
    textView.editable = NO;
    textView.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:textView];
}














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
