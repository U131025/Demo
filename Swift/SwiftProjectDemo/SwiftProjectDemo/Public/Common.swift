//
//  Common.swift
//  SwiftDemo
//
//  Created by Mojy on 2018/1/22.
//  Copyright © 2018年 com.swiftdemo.app. All rights reserved.
//

import Foundation
import SnapKit
import RxCocoa
import RxSwift
import Moya

///// color fun ////////////
func RGB(red:CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return RGBA(red: red, green: green, blue: blue, alpha: 1.0)
}

func RGBA(red:CGFloat, green: CGFloat, blue: CGFloat, alpha:CGFloat) -> UIColor {
    return UIColor.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
}

func createImageWithColor(color: UIColor) -> UIImage {

    let rect = CGRect.init(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    
    let thempImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return thempImage!
}
