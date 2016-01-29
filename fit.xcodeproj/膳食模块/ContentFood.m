//
//  ContentFood.m
//  fit
//
//  Created by mac on 15-8-4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "ContentFood.h"

@implementation ContentFood
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.nickname = dict[@"nickname"];
        self.picturename = dict[@"picturename"];
        self.briefly = dict[@"briefly"];
        self.content = dict[@"content"];
        self.bigpicturename = dict[@"bigpicturename"];
    }
    return self;
}
@end
