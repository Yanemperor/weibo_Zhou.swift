//
//  PersonalInfoCenter.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/13.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit

class PersonalInfoCenter: NSObject {
    var userData: UserData?
    static let shared = PersonalInfoCenter()
    private override init() {}
}
