//
//  ZhouRegularExpressionsTools.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/3/7.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit

class ZhouRegularExpressionsTools: NSObject {
    //匹配用户 @小黑
    func matchingUserName(text: String) -> NSMutableArray {
        let pattern: String = "@[-_a-zA-Z0-9\\u4E00-\\u9FA5]+"
        return self.matching(pattern: pattern, text: text)
    }
    //匹配话题 #小黑是单身狗#
    func matchingTopic(text: String) -> NSMutableArray {
        let pattern: String = "#[^@#]+?#"
        return self.matching(pattern: pattern, text: text)
    }
    //匹配话题 http https
    func matchingHTTP(text: String) -> NSMutableArray {
        let pattern: String = "http(s)?://([A-Za-z0-9._-]+(/)?)*"
        return self.matching(pattern: pattern, text: text)
    }
    
    fileprivate func matching(pattern: String, text: String) -> NSMutableArray {
        let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options(rawValue: 0))
        let res: Array = regex.matches(in: text, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, text.characters.count))
        let array: NSMutableArray = NSMutableArray()
        for result in res {
//            print(NSStringFromRange(result.range))
            array.add(result.range)
        }
        if res.count > 0 {
            return array
        }
        return array
    }
}
