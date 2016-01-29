//
//  ViewController.m
//  fit
//
//  Created by kai on 15/8/3.
//  Copyright (c) 2015年 K.K Studio. All rights reserved.
//

#import "ViewController.h"
#import "LoseWeight.h"
#import "KeepFit.h"
#import "Food.h"
#import "Settings.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITabBarController *fitBar = [[UITabBarController alloc]init];
    
    LoseWeight *loseWeightVc = [LoseWeight new];
    KeepFit *keepFitVc = [KeepFit new];
    Food *foodVc =[Food new];
    Settings *settingsVc = [Settings new];
    
    UINavigationController *loseWeightNavi = [[UINavigationController alloc]initWithRootViewController:loseWeightVc];
    UINavigationController *keepFitNavi = [[UINavigationController alloc]initWithRootViewController:keepFitVc];
    UINavigationController *foodNavi = [[UINavigationController alloc]initWithRootViewController:foodVc];
    UINavigationController *settingsNavi = [[UINavigationController alloc]initWithRootViewController:settingsVc];
    
    loseWeightVc.title = @"减肥";
    keepFitVc.title = @"健身";
    foodVc.title = @"膳食";
    settingsVc.title = @"设置";
    
    loseWeightNavi.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"减肥" image:[UIImage imageNamed:@"loss_weight"] selectedImage:[UIImage imageNamed:@"loss_weight_gray"]];
    keepFitNavi.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"健身" image:[UIImage imageNamed:@"keep_fit"] selectedImage:[UIImage imageNamed:@"keep_fit_gray"]];
    foodNavi.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"膳食" image:[UIImage imageNamed:@"food"] selectedImage:[UIImage imageNamed:@"food_gray"]];
    settingsNavi.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"设置" image:[UIImage imageNamed:@"setting"] selectedImage:[UIImage imageNamed:@"settings_gray"]];
    
    
    fitBar.viewControllers = @[loseWeightNavi,keepFitNavi,foodNavi,settingsNavi];
    
    [UIApplication sharedApplication].delegate.window.rootViewController = fitBar;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
