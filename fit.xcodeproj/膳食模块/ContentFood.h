//
//  ContentFood.h
//  fit
//
//  Created by mac on 15-8-4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentFood : NSObject

@property (nonatomic, copy) NSString * nickname;

@property (nonatomic, copy) NSString * picturename;

@property (nonatomic, copy) NSString * briefly;

@property (nonatomic, copy) NSString * content;

@property (nonatomic, copy) NSString * bigpicturename;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
