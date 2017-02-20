//
//  BaseTabBarController.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/9.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController()
        UITabBar.appearance().tintColor = UIColor.orange
        let tabBar: BaseTabBar = BaseTabBar()
        self.setValue(tabBar, forKey: "tabBar")
        
        // Do any additional setup after loading the view.
    }

    func addChildViewController() {
        setupOneChildViewController("首页", image: "tabbar_home", selectedImage: "tabbar_home_selected", controller: HomeViewController())
        setupOneChildViewController("信息", image: "tabbar_message_center", selectedImage: "tabbar_message_center_selected", controller: NewsViewController())
        setupOneChildViewController("发现", image: "tabbar_discover", selectedImage: "tabbar_discover_selected", controller: FindViewController())
        setupOneChildViewController("我", image: "tabbar_profile", selectedImage: "tabbar_profile_highlighted", controller: MeViewController())
    }
    
    fileprivate func setupOneChildViewController(_ title: String, image: String, selectedImage: String, controller: UIViewController) {
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(named: image)
        controller.tabBarItem.selectedImage = UIImage(named: selectedImage)
        let naviController = BaseNavigationController.init(rootViewController: controller)
        addChildViewController(naviController)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
