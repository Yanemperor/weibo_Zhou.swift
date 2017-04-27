//
//  Common.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/9.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import Foundation
import UIKit
import YYCategories
//import ReactiveCocoa
import Kingfisher
import SwiftyJSON
import SnapKit
//微博参数
public let kAppKey = "2671763089"
public let kAppSecret = "dcc5390a2a71a3d7c67ef8fc541c0b4a"
public let kAppRedirectURI = "https://api.weibo.com/oauth2/default.html"
//public let kAppKey = "2045436852"
//public let kAppRedirectURL = "http://www.sina.com"

//宏定义
public let kUserDefaults = UserDefaults.standard
public let kWBToken = "2.00KDEKPGyY87OCf4155b9f40Dd4jaE"
public let kWBUserID = "uid"
public let kWBRefreshToken = "wbRefreshToken"
public var kisLogin = UserData.shared.isLongin
//设置屏幕尺寸
public let kScreenWidth = UIScreen.main.bounds.size.width
public let kScreenHeight = UIScreen.main.bounds.size.height

func kURL(url: String) -> URL {
    return URL.init(string: url)!
}

func kImage(imageName: String) -> UIImage {
    return UIImage(named: imageName)!
}

//RGB转换
func RGB(r:CGFloat, g:CGFloat, b:CGFloat) ->UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
}

func CGFloatFromPixel(num: CGFloat) -> CGFloat {
    return num / UIScreen.main.scale
}

extension DispatchTime: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = DispatchTime.now() + .seconds(value)
    }
}

extension DispatchTime: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = DispatchTime.now() + .milliseconds(Int(value * 1000))
    }
}









