//
//  AppDelegate.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/4.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var wbToken: String?
    var wbCurrentUserID: String?
    var wbRefreshToken: String?
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        setWeibo()
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        let baseTabBar = BaseTabBarController()
        window?.rootViewController = baseTabBar
        return true
    }
    /*
    func setWeibo() {
        WeiboSDK.enableDebugMode(true)
        WeiboSDK.registerApp(kAppKey)
        //判断是否已经登入
        self.wbToken = kUserDefaults.object(forKey: kWBToken) as? String
        if self.wbToken != nil {
            kisLogin = true
            UserData.shared.wbToken = self.wbToken
        }else{
            kisLogin = false
            UserData.shared.wbToken = ""
        }
    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return WeiboSDK.handleOpen(url, delegate: self)
    }
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return WeiboSDK.handleOpen(url, delegate: self)
    }
    
    func didReceiveWeiboRequest(_ request: WBBaseRequest!) {
        
    }
    
    func didReceiveWeiboResponse(_ response: WBBaseResponse!) {
        if (response.isKind(of: WBAuthorizeResponse.self)) {
            /*
            let message = "响应状态: \(response.statusCode.rawValue)\nresponse.userId: \((response as! WBAuthorizeResponse).userID)\nresponse.accessToken: \((response as! WBAuthorizeResponse).accessToken)\n响应UserInfo数据: \(response.userInfo)\n原请求UserInfo数据: \(response.requestUserInfo)"
            let alert = UIAlertView(title: "认证结果", message: message, delegate: nil, cancelButtonTitle: "确定")
            alert.show()
 
            self.wbToken = (response as! WBAuthorizeResponse).accessToken
            self.wbCurrentUserID = (response as! WBAuthorizeResponse).userID
            self.wbRefreshToken = (response as! WBAuthorizeResponse).refreshToken
            kUserDefaults.set(self.wbToken, forKey: kWBToken)
            kUserDefaults.set(self.wbCurrentUserID, forKey: kWBUserID)
            kUserDefaults.set(self.wbRefreshToken, forKey: kWBRefreshToken)
            */
        }else if(response.isKind(of: WBSendMessageToWeiboResponse.self)){
            let sendMessageToWeiboResponse: WBSendMessageToWeiboResponse = response as! WBSendMessageToWeiboResponse
            let accessToken: String = sendMessageToWeiboResponse.authResponse.accessToken
            if accessToken.isEmpty {
                wbToken = accessToken
            }
        }
        
        
        
        
        
        
        
    }
    */
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

