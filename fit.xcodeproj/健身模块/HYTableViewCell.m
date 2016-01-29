//
//  HYTableViewCell.m
//  fit
//
//  Created by huangyou on 15-8-4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "HYTableViewCell.h"

@implementation HYTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    // 宽
    float width = self.frame.size.width;
    // 重新设置imageView的大小
    self.imageView.frame = CGRectMake(5, 2, 34, 34);
    // 设置圆角大小
    self.imageView.layer.cornerRadius = 17;
    // 设置是否剪切
    self.imageView.layer.masksToBounds = YES;
    // 重新设置textLabel的大小
    self.textLabel.frame = CGRectMake(50, 2, width - 50, 20);
    // 重新设置detailTextLabel大小
    self.detailTextLabel.frame = CGRectMake(50, 24, width - 50, 16);
    // 设置detailTextLabel的字体颜色
    self.detailTextLabel.textColor = [UIColor lightGrayColor];
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
