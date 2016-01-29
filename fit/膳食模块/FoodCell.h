//
//  FoodCell.h
//  fit
//
//  Created by 万自雄 on 15-8-4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodCell : UITableViewCell
@property(nonatomic,strong)UILabel *heading,*introduction;
@property(nonatomic,strong)UIImageView *image;
-(void)AddDate:(int)index;
@end
