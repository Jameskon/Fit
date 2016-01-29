//
//  NextUIViewController.m
//  fit
//
//  Created by 万自雄 on 15-8-4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "NextUIViewController.h"
#import "ContentFood.h"
@interface NextUIViewController ()//: ()
{
    UIScrollView *scroll;
    CGSize sizeBriefly;
    CGSize sizeContent;
}
@end

@implementation NextUIViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    scroll=[[UIScrollView alloc]init];
    [self addSub];
    scroll.frame=self.view.bounds;
    scroll.contentSize=CGSizeMake(self.view.frame.size.width, _pictureName.frame.size.height+sizeBriefly.height+sizeContent.height+10);
    // scroll.showsHorizontalScrollIndicator=NO;
    scroll.showsVerticalScrollIndicator=NO;
    [self.view addSubview:scroll];

}
-(void)addSub
{
    // 大图
    _pictureName.frame=CGRectMake(5, 5, 200, 200);
    _pictureName.center=CGPointMake(self.view.frame.size.width/2, 5+_pictureName.frame.size.width/2);
//    _pictureName.image=[UIImage imageNamed:@"3.jpg"];
    _pictureName.userInteractionEnabled=YES;
    _pictureName.contentMode=UIViewContentModeScaleAspectFill;
    [scroll addSubview:_pictureName];
    
    sizeBriefly=[self getSize:_briefly.text];
    _briefly.frame=CGRectMake(5, _pictureName.frame.size.height, sizeBriefly.width-5, sizeBriefly.height);
    _briefly.numberOfLines=0;
    [scroll addSubview:_briefly];
    

    // 正文
    sizeContent=[self getSize:_content.text];
    _content.frame=CGRectMake(5,_pictureName.frame.size.height+sizeBriefly.height+10,sizeContent.width-5,sizeContent.height);
    _content.numberOfLines=0;
    [scroll addSubview:_content];

}
-(void)AddDates:(int)count
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"food.plist" ofType:nil];
    NSDictionary * food = [NSArray arrayWithContentsOfFile:path][count];
    ContentFood * contentFood = [[ContentFood alloc]initWithDict:food];
    _pictureName=[[UIImageView alloc]init];
    if (count==8) {
        
        contentFood.bigpicturename=@"9.png";
        
    }
    _pictureName.image = [UIImage imageNamed:contentFood.bigpicturename];
    self.title=contentFood.nickname;
    _content=[[UILabel alloc]init];
    _content.text=contentFood.content;
    _briefly=[[UILabel alloc]init];
    _briefly.text = contentFood.briefly;
}
-(CGSize)getSize:(NSString *)text
{
  float  w =  self.view.frame.size.width;
    CGRect r =[text boundingRectWithSize:CGSizeMake(w-10, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    r.size.height=MAX(25, r.size.height);
    r.size.width=w;
    r.size.height+=20;
    return r.size;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
