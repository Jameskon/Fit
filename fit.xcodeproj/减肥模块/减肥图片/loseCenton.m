//
//  loseCenton.m
//  fit
//
//  Created by 想牵着你的手 on 15-8-4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "loseCenton.h"



@interface loseCenton ()

@end

@implementation loseCenton



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/2)];
    _textView.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:_textView];
    _textView.text = _r();
    _textView.editable = NO;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(25, self.navigationController.navigationBar.frame.size.height+self.navigationController.navigationBar.frame.origin.y, self.view.frame.size.width-50, self.view.frame.size.height/2-self.navigationController.navigationBar.frame.size.height-self.navigationController.navigationBar.frame.origin.y)];
    [self.view addSubview:_imageView];
    _imageView.image = [UIImage imageNamed:_imaegname()];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;

}


-(void)viewWillDisappear:(BOOL)animated
{
    [_imageView removeFromSuperview];
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
