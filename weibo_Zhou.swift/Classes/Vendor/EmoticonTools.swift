//
//  EmoticonTools.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/3/8.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit

class EmoticonTools: NSObject {
    //单例
    static var sharedInstance: EmoticonTools {
        struct myStatic {
            static var instance: EmoticonTools = EmoticonTools()
        }
        return myStatic.instance
    }
    var dataArray: NSArray?
    var dataDic: NSMutableDictionary = NSMutableDictionary()
    var imagePath: String?
    
    func getEmoticon() {
        let emoticonBundlePath = Bundle.main.path(forResource: "EmoticonQQ", ofType: "bundle")
        imagePath = emoticonBundlePath
        let bundle = Bundle(path: emoticonBundlePath!)
        let plistPath = bundle?.path(forResource: "info", ofType: "plist")
        let array = NSArray(contentsOfFile: plistPath!)
        dataArray = array
        dataDic.removeAllObjects()
        for dic in array! {
            let tempDic: NSDictionary = dic as! NSDictionary
            let keyArray = tempDic.allKeys
            dataDic.setValue(tempDic[keyArray[0]], forKey: keyArray[0] as! String)
        }
    }
}


















