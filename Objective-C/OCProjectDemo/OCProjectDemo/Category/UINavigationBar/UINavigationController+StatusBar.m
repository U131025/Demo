//
//  UINavigationController+StatusBar.m
//  Demo
//
//  Created by Mojy on 2016/12/22.
//  Copyright © 2016年 app.Demo.com. All rights reserved.
//

#import "UINavigationController+StatusBar.h"

@implementation UINavigationController (StatusBar)

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return self.visibleViewController.preferredStatusBarStyle;
}

@end
