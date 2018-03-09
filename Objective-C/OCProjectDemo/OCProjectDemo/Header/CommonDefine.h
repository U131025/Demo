//
//  CommonDefine.h
//  OCProjectDemo
//
//  Created by Mojy on 2018/3/9.
//  Copyright © 2018年 Mojy. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h

//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]

//系统设置界面url
#define SettingURL [NSURL URLWithString:UIApplicationOpenSettingsURLString]
//跳转设置界面
#define JumpSysSetting if ([[UIApplication sharedApplication] canOpenURL:SettingURL]) {\
[[UIApplication sharedApplication] openURL:SettingURL];\
}

///设备屏幕尺寸 屏幕Size
#define kScreen_Size      [[UIScreen mainScreen] bounds].size
#define kScreen_Height   ([UIScreen mainScreen].bounds.size.height)
#define kScreen_Width    ([UIScreen mainScreen].bounds.size.width)

//适配因子，以6P为准
#define SYRealValue(value) ((value)/414.0f*[UIScreen mainScreen].bounds.size.width)

//字体设置
#define Font(size) [UIFont systemFontOfSize:size]
#define BoldFont(size) [UIFont boldSystemFontOfSize:size]

#endif /* CommonDefine_h */
