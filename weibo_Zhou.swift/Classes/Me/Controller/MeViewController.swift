//
//  MeViewController.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/9.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit

class MeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI() -> Void {
//        view.addSubview(loginBtn)
    }
    
    // MARK: - View(页面处理)
    
    
    // MARK: - XXXDelegate
    
    
    // MARK: - 对外接口
    
    
    // MARK: - private methods(内部接口)
    func loginBtnClick() {
        let request: WBAuthorizeRequest = WBAuthorizeRequest.request() as! WBAuthorizeRequest
        request.redirectURI = kAppRedirectURI
        request.scope = "all"
        request.userInfo = ["SSO_From": "MeViewController",
            "Other_Info_1": NSNumber.init(value: 123),
            "Other_Info_2": ["obj1", "obj2"],
            "Other_Info_3": ["key1": "obj1", "key2": "obj2"]]
        WeiboSDK.send(request)
    }
    
    // MARK: - loading
    
    
    // MARK: - 懒加载
    
    lazy var loginBtn: UIButton = {
        let temp: UIButton = UIButton(type: .custom)
        temp.backgroundColor = UIColor.orange
        temp.size = CGSize.init(width: 50, height: 50)
        temp.center = self.view.center
        temp.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        return temp
    }()

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
