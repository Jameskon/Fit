//
//  loseCenton.h
//  fit
//
//  Created by 想牵着你的手 on 15-8-4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface loseCenton : UIViewController

@property (nonatomic ,strong) UITextView *textView;

@property (nonatomic ,strong) UIImageView *imageView;


@property (nonatomic ,copy) NSString* (^r)(void);

@property (nonatomic ,copy) NSString* (^imaegname)(void);

@end

