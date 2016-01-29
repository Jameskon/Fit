//
//  loseDates.h
//  fit
//
//  Created by 想牵着你的手 on 15-8-4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface loseDates : NSObject
@property(nonatomic,strong)NSString *image1,*image2,*headLab,*birefLab,*centonLab;
-(id)initWithAttribte:(NSDictionary*)dic;
@end
