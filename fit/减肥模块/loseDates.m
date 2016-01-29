//
//  loseDates.m
//  fit
//
//  Created by 想牵着你的手 on 15-8-4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "loseDates.h"

@implementation loseDates
-(id)initWithAttribte:(NSDictionary *)dic{
    self=[super init];
    if(self){
         self.image1=dic[@"picturename"];
         self.image2=dic[@"bigpicturename"];
         self.headLab=dic[@"nickname"];
         self.birefLab=dic[@"briefly"];
        self.centonLab=dic[@"content"];
    }
    return self;
}
@end
