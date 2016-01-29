//
//  NextUIViewController.h
//  fit
//
//  Created by 万自雄 on 15-8-4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextUIViewController : UIViewController
@property(nonatomic,strong)UIImageView *pictureName;
@property(nonatomic,strong)UILabel *briefly,*content;
-(void)AddDates:(int)count;
-(CGSize)getSize:(NSString *)text;
@end
