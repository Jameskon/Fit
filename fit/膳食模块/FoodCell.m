//
//  FoodCell.m
//  fit
//
//  Created by 万自雄 on 15-8-4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "FoodCell.h"
#import "ContentFood.h"
@implementation FoodCell
-(instancetype)init
{
    return [self initWithFrame:CGRectZero];
}
-(instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSub];
        
    }
    return self;
}
-(void)addSub
{
    _image=[[UIImageView alloc]initWithFrame:CGRectMake(2, 2, 40, 40)];
    _image.userInteractionEnabled=YES;
    _image.layer.cornerRadius=20;
    _image.clipsToBounds=YES;
    [self addSubview:_image];
    _heading=[[UILabel alloc]initWithFrame:CGRectMake(44, 2, self.frame.size.width-46, 20)];
    [self.contentView addSubview:_heading];
    _introduction=[[UILabel alloc]initWithFrame:CGRectMake(44, 24, self.frame.size.width-5, 16)];
    _introduction.textColor=[UIColor grayColor];
    _introduction.font=[UIFont systemFontOfSize:13];
    [self.contentView addSubview:_introduction];
}
-(void)AddDate:(int)index
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"food.plist" ofType:nil];
    NSDictionary * food = [NSArray arrayWithContentsOfFile:path][index];
    ContentFood * contentFood = [[ContentFood alloc]initWithDict:food];
    _image.image = [UIImage imageNamed:contentFood.picturename];
    _heading.text = contentFood.nickname;
    _introduction.text = contentFood.briefly;
}
@end
