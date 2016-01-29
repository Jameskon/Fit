//
//  Text.m
//  fit
//
//  Created by 万自雄 on 15-8-4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "Text.h"

@implementation Text
-(CGSize)getSize
{
    float w=[UIScreen mainScreen].bounds.size.width;
    CGRect r=[_text boundingRectWithSize:CGSizeMake(w-10, 1000) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    r.size.height=MAX(20, r.size.height);
    r.size.width+=20;
    r.size.height+=20;
    return  r.size;
}
@end
