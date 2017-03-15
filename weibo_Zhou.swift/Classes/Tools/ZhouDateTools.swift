//
//  ZhouDateTools.swift
//  swift_Date
//
//  Created by zzl on 2016/11/25.
//  Copyright © 2016年 Zhou. All rights reserved.
//

import UIKit

let DATEFormat: String = "YYYY-MM-dd HH:mm:ss"

class ZhouDateTools: NSObject {
    //年月日时分秒, 需要init(timeStamp: String)才能获得
    var year: Int?
    var month: Int?
    var day: Int?
    var hour: Int?
    var minute: Int?
    var second: Int?
    var date: Date?
    
    
    //传入时间戳(1480063787)
    init(timeStamp: String) {
        let timeInterval: TimeInterval = TimeInterval(timeStamp)!
        let date = Date.init(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DATEFormat
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        year = dateComponents.year
        month = dateComponents.month
        day = dateComponents.day
        hour = dateComponents.hour
        minute = dateComponents.minute
        second = dateComponents.second
    }
    //英文时间 "Fri Nov 25 16:49:47 +0800 2016"
    var us_time: String?
    init(en_USTimeStamp: String) {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "EEE MMM dd HH:mm:ss Z yyyy"
        formatter.locale = Locale.init(identifier: "en_US")
        date = formatter.date(from: en_USTimeStamp)!
    }
    
    //获取当前北京时间Date
    class func getBeijingCurrentDate() -> Date {
        //获取当前时间
        let currentdate = Date()
        //初始化DateFormatter
        return currentdate
    }
    //获取当前北京时间String
    class func getBeijingCurrentString() -> String {
        //获取当前时间
        let currentdate = Date()
        //初始化DateFormatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DATEFormat
        let beiJingDateString = dateFormatter.string(from: currentdate)
        return beiJingDateString
    }
    //时间戳转String    1480061666(String) -> 2016-11-25 16:12:09
    class func timeStampToStinr(dateString :String) -> String {
        let timeInterval: TimeInterval = TimeInterval(dateString)!
        let date = Date.init(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DATEFormat
        let dateStr = dateFormatter.string(from: date)
        return dateStr
    }
    
    func weiboTime() -> String {
        var timeInterval: TimeInterval = (date?.timeIntervalSinceNow)!
        timeInterval = -timeInterval
        var temp = 0
        var result: String?
        
        let formatter: DateFormatter = DateFormatter()
        if timeInterval < 60 {
            result = "刚刚"
            return result!
        }else{
            temp = Int(timeInterval) / 60
            if temp < 60 {
                result = "\(temp)分钟前"
                return result!
            }else{
                temp = temp / 60
                if temp < 24 {
                    result = "\(temp)小时前"
                    return result!
                }else{
                    temp = temp / 24
                    if temp < 30 {
                        result = "\(temp)天前"
                        return result!
                    }else{
                        temp = temp / 30
                        if temp < 12 {
                            formatter.date(from: "MM-dd")
                            let string = formatter.string(from: date!)
                            result = string
                            return result!
                        }else{
                            temp = temp / 12
                            formatter.date(from: "yyyy-MM-dd")
                            let string = formatter.string(from: date!)
                            result = string
                            return result!
                        }
                    }
                }
            }
        }
    }
}
