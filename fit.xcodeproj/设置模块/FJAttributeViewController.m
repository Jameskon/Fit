//
//  FJAttributeViewController.m
//  fit
//
//  Created by Admin on 15/8/4.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "FJAttributeViewController.h"
#include "FJDataFile.h"



@interface FJAttributeViewController () <UIPickerViewDataSource,UIPickerViewDelegate>
{
    
    FJAttributeStaty _staty;
    
    UIButton * _okBtn;
    
/*  =================字体样式设置全局变量 ================ */
    /** 所有字体样式 */
    NSMutableArray * _fonts;
   /** 查看样式的 lab */
    UITextView * _lookStatyTextView;

/* =======================界面样式设置全局变量 ========================= */
    
    /**  查看字体大小 */
   UITextView * _textView;
    
    
//    =================
    
    
    NSString * _filePath;
    
    NSMutableDictionary * _fileData;
    
}
@end

@implementation FJAttributeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    _filePath = [path stringByAppendingPathComponent:FJSetDataFileName];
    
    _fileData = [NSMutableDictionary dictionaryWithContentsOfFile:_filePath];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigtion];
    
    
    
    
    [self selectStaty];
  
    
}
#pragma mark -  设置导航控制器栏
- (void)setNavigtion
{
    /** 确定按钮 */
    UIButton * okBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [okBtn setTitle:@"确定" forState:UIControlStateNormal];
    okBtn.frame = CGRectMake(0, 0, 60, 50);
    [okBtn addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _okBtn = okBtn;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:okBtn];
}

#pragma mark - 判读选择情况
- (void)selectStaty
{
    switch (_staty) {
        case FJAttributeStatyFontStaty:
            [self addFontStatyView];
            break;
            case FJAttributeStatyFontBig:
            [self setAppStaty];
            break;
        default:
            break;
    }
}

#pragma mark - 重写类型
- (void)setAttribute:(FJAttributeStaty)attribute
{
    _staty = attribute;
}



#pragma mark - 确定按钮点击事件
- (void)okBtnClick
{
    
    [_fileData writeToFile:_filePath atomically:YES];
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 字体大小

- (void)setAppStaty
{
    // 演示字体大小 textView
    UITextView * textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height - 50)];
    _textView = textView;
    textView.text = @"//    //  FJAttributeViewController.m    //  fit    //    //  Created by Admin on 15/8/4.//  Copyright (c) 2015年 K.K Studio. All rights reserved.//";
    textView.textAlignment = NSTextAlignmentCenter;
    NSString * vla =  _fileData[FJFontBigKey];
    textView.font = [UIFont systemFontOfSize:[vla floatValue]];
    [self.view addSubview:textView];
    
    // 选择器
    UISlider * slider = [[UISlider alloc]initWithFrame:CGRectMake(60, self.view.frame.size.height - 60, self.view.frame.size.width - 120, 30)];
    slider.minimumValue = 10;
    slider.maximumValue = 30;
    slider.value = [vla floatValue];
    [slider addTarget:self action:@selector(sliderChang:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
    
    //    左右标示
    UILabel * max = [[UILabel alloc]initWithFrame:CGRectMake(slider.frame.size.width + slider.frame.origin.x, slider.frame.origin.y - 5, 30,30 )];
    max.text = @"+";
    max.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:max];
    
    UILabel * min = [[UILabel alloc]initWithFrame:CGRectMake(slider.frame.origin.x - 30, slider.frame.origin.y - 5, 30,30)];
    min.text = @"-";
    min.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:min];
}

#pragma mark - 字体大小变化对应
- (void)sliderChang:(UISlider *)sender
{
    _textView.font = [UIFont systemFontOfSize:sender.value];
    
    NSString * s = [NSString stringWithFormat:@"%f",sender.value];
    
    //  存储字体大小
    [_fileData setObject:s forKey:FJFontBigKey];
    
}



#pragma mark - 设置 "字体样式"
/** 设置 "字体样式" 的界面 */
- (void)addFontStatyView
{
    [self getAllFontStaty];
    CGFloat h = self.view.frame.size.height;
    UIPickerView * fontStatyPicker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 0)];
    
    // 获取到当前设置的字体
    NSString * fontStatyString =  _fileData[FJFontStatyKey];
    NSLog(@"%@",fontStatyString);
    // 变量第几个
    NSInteger indext;
    if (!fontStatyString) {
        // 判断是否存在这个字体
        indext = 0;
        
    }else indext = [_fonts indexOfObject:fontStatyString];
    
    fontStatyPicker.delegate = self;
    fontStatyPicker.dataSource = self;
    [self.view addSubview:fontStatyPicker];
    
    // 设置picker的位置;
    [fontStatyPicker selectRow:indext inComponent:0 animated:NO];
    
    
    
    // =============================================
    _lookStatyTextView = [[UITextView alloc]initWithFrame:CGRectMake(20, fontStatyPicker.frame.origin.y + fontStatyPicker.frame.size.height + 20, self.view.frame.size.width - 40, h - fontStatyPicker.frame.size.height - 100)];
    _lookStatyTextView.text = @"我们用心制作,良心服务,只为用户的使用考虑;如有不适之处,欢迎指出; abcdefghijklmnopqrstuvwxyz;ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    _lookStatyTextView.font = [UIFont fontWithName:_fonts[indext] size:20];
    
    [self.view addSubview:_lookStatyTextView];
}

- (void)getAllFontStaty
{
    NSArray * familyNames = [UIFont familyNames];
    
    _fonts = [NSMutableArray arrayWithArray:familyNames];
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _fonts.count;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 0, 0)];
    lab.text = _fonts[row];
    lab.font = [UIFont fontWithName:_fonts[row] size:17];
    
    lab.textAlignment = NSTextAlignmentCenter;
    
    return lab;
}

#pragma mark - picker 选择中得字体样式
/** 选择字体样式 */
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _lookStatyTextView.font = [UIFont fontWithName:_fonts[row] size:20];
    
    
    // 存储字体样式
    
    [_fileData setObject:_fonts[row] forKey:FJFontStatyKey];
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 50;
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
