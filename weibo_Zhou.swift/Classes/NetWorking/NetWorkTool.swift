//
//  NetWorkTool.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/13.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit
import Alamofire
enum MethodType {
    case GET
    case POST
}

class NetWorkTool {
    class func request(type: MethodType, urlString: String, paramters: [String: Any]? = nil, finishedCallback: @escaping (_ result: Any) -> ()) {
        //获取类型
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        //发送网络请求
        Alamofire.request(urlString, method: method, parameters: paramters).validate().responseJSON { response in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false            
            switch response.result {
            case .success:
                guard let result = response.result.value else {
                    return
                }
                
                finishedCallback(result as AnyObject)
            case .failure(let error):
                print(error)
                return
            }
        }
    }
    
    // 判断网络情况
    func startMonitoringNet() -> String {
        var netTypeString: String?
        var manager: NetworkReachabilityManager?
        manager = NetworkReachabilityManager(host: "www.baidu.com")
        manager?.listener = { status in
            switch status {
            case .notReachable:
                netTypeString = "网络已断开"
            case .unknown:
                netTypeString = "其他情况"
            case.reachable(NetworkReachabilityManager.ConnectionType.wwan):
                netTypeString = "2G/3G/4G"
            case.reachable(NetworkReachabilityManager.ConnectionType.ethernetOrWiFi):
                netTypeString = "WIFI"
            }
            self.netTypeString = netTypeString
            manager?.startListening()
        }
        return netTypeString!
    }
    var netTypeString: String?
}
