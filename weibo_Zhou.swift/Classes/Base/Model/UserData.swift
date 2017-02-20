//
//  UserData.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/13.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit

class UserData: NSObject {
    var isLongin: Bool?
    var wbToken: String?
    static let shared = UserData()
    private override init() {}
}
