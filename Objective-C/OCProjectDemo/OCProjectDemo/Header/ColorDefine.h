//
//  ColorDefine.h
//  MYBaseProject
//
//  Created by Mojy on 2017/7/19.
//  Copyright © 2017年 com.baseproject. All rights reserved.
//

#ifndef ColorDefine_h
#define ColorDefine_h

// RGB颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

//缺省字体颜色，蓝色
#define DefaultColorBlue RGB(97, 170, 221)
#define DefaultColorWhite [UIColor whiteColor]

#endif /* ColorDefine_h */
