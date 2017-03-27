//
//  HomeViewModel.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/13.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit
import YYModel
import SwiftyJSON
class HomeViewModel: BaseViewModel {
    func requestData(finishedCallback: @escaping() -> ()) {
        let paramters: Dictionary = ["access_token" : kWBToken]
        NetWorkTool.request(type: .GET, urlString: home_timeline, paramters: paramters) { (request) in
            print(JSON.init(request))
            guard let dict = request as? [String : Any] else { return }
            guard let array = dict["statuses"] as? [[String : Any]] else { return }
            DispatchQueue.global().async {
                for dic in array {
                    let model = HomeModel.yy_model(withJSON: dic)
                    let homeStatusLayout: HomeStatusLayout = HomeStatusLayout()
                    homeStatusLayout.homeModel = model
                    self.dataArray.add(homeStatusLayout as Any)
                }
                DispatchQueue.main.async {
                    finishedCallback()
                }
            }
        }
    }
}
