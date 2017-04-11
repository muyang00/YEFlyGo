//
//  GlobalConfig.swift
//  YEFlyGo
//
//  Created by yongen on 17/4/7.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

let kScreenW : CGFloat = UIScreen.main.bounds.width
let kScreenH : CGFloat = UIScreen.main.bounds.height

extension UIColor {
    class func RGB(_ r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    class func colorFromHex(_ Hex: UInt32) -> UIColor {
        return UIColor(red: CGFloat((Hex & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((Hex & 0xFF00) >> 8) / 255.0,
                            blue: CGFloat((Hex & 0xFF)) / 255.0,
                            alpha: 1.0)
    }
    class func randomColor () -> UIColor{
        return UIColor(red: CGFloat(arc4random_uniform(256))/255.0, green: CGFloat(arc4random_uniform(256))/255.0, blue: CGFloat(arc4random_uniform(256))/255.0, alpha: 1.0)
    }
    
}


extension UIImage {
    class func imageWithColor (_ color: UIColor, size: CGSize) -> UIImage {
        var size = size
        if size.equalTo(CGSize.zero){
            size = CGSize(width: 5, height: 5)
        }
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}


/*
 
 Int,
 Int8,
 Int16,
 Int32,
 Int64,
 UInt,
 UInt8,
 UInt16,
 UInt32,
 UInt64,
 Bool,
 Float,
 Double,
 String,
 */

class GlobalConfig: UIView {

}
