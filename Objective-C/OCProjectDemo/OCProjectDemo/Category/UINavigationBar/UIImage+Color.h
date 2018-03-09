//
//  UIImage+Color.h
//  MobileSiBu
//
//  Created by 老徐 on 15/4/28.
//  Copyright (c) 2015年 sibu.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 
 通过color颜色和size转换成UIImage
 */
@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage*)createImageWithColor: (UIColor*) color;

@end

