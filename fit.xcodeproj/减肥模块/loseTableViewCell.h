//
//  loseTableViewCell.h
//  fit
//
//  Created by 想牵着你的手 on 15-8-5.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "loseDates.h"
@interface loseTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *images;
@property(nonatomic,strong)UILabel *nickname,*briefly;
-(void)setDataModel:(loseDates*)date;
@end
