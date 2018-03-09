//
//  CustomNavViewController.m
//  MYBaseProject
//
//  Created by Mojy on 2017/7/19.
//  Copyright © 2017年 com.baseproject. All rights reserved.
//

#import "CustomNavViewController.h"
#import "UINavigationBar+Awesome.h"

@interface CustomNavViewController ()<UINavigationControllerDelegate>

@property (nonatomic, weak) id PopDelegate;

@end

@implementation CustomNavViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.PopDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
    
    //背景颜色
    [self.navigationBar lt_setBackgroundColor:DefaultColorBlue];
    //字体颜色
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : DefaultColorWhite, NSFontAttributeName : [UIFont boldSystemFontOfSize:20]}];
    
    [self.navigationBar setTintColor:DefaultColorWhite];
    
    
}

//解决返回手势失效的问题
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.PopDelegate;
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

//解决push时隐藏Tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

//设置通用返回按钮
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backBarButtonItemAction)];
    
    viewController.navigationItem.backBarButtonItem = backBarButtonItem;
}

- (void)backBarButtonItemAction
{
    [self popViewControllerAnimated:YES];
}


@end
