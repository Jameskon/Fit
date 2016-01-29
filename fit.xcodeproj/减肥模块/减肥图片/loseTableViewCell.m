//
//  loseTableViewCell.m
//  fit
//
//  Created by 想牵着你的手 on 15-8-5.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "loseTableViewCell.h"

@implementation loseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self addSubview];
    }
    return self;
}
-(void)addSubview{
    [super layoutSubviews];
    _images=[[UIImageView alloc]initWithFrame:CGRectMake(5, 2, 34, 34)];
    _images.layer.cornerRadius = 17;
    _images.layer.masksToBounds = YES;
    [self addSubview:_images];
    _nickname=[[UILabel alloc]initWithFrame:CGRectMake(50, 2, self.frame.size.width - 50, 20)];
    _nickname.textAlignment=  NSTextAlignmentLeft;
    [self addSubview:_nickname];
    _briefly =[[UILabel alloc]initWithFrame:CGRectMake(50, 24, self.frame.size.width - 50, 16)];
    _briefly.font=[UIFont systemFontOfSize:12];
    _briefly.textColor=[UIColor grayColor];
    [self addSubview:_briefly];
}
-(void)setDataModel:(loseDates *)date{
    _images.image=[UIImage imageNamed:date.image1];
    _nickname.text=date.headLab;
    _briefly.text=date.birefLab;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
