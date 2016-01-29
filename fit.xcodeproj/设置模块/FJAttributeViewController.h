//
//  FJAttributeViewController.h
//  fit
//
//  Created by Admin on 15/8/4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum
{
    /** 字体大小 */
    FJAttributeStatyFontBig,
    /** 字体样式 */
    FJAttributeStatyFontStaty,

    
}FJAttributeStaty;


/** 设置属性界面 */
@interface FJAttributeViewController : UIViewController

/** 样式调整 */
@property (nonatomic,assign) FJAttributeStaty attribute;



@end








