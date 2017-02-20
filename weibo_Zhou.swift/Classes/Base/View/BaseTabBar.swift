//
//  BaseTabBar.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/10.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit

class BaseTabBar: UITabBar {

    override func layoutSubviews() {
        super.layoutSubviews()
        let w = self.bounds.size.width
        let h = self.bounds.size.height
        var btnX: CGFloat?
        let btnY: CGFloat = 0
        let btnW = w / 5
        let btnH = h
        var i = 0
        //1.遍历当前tabBar上的所有view
        for tabBarBtn in self.subviews {
            //2.如果是UITabBarButton，就取出来重新设置他们的位置
            if tabBarBtn.isKind(of: NSClassFromString("UITabBarButton")!) {
                btnX = CGFloat(i) * btnW
                tabBarBtn.frame = CGRect.init(x: btnX!, y: btnY, width: btnW, height: btnH)
                //当到了第二个的时候，在加一个位置空添加按钮的位置
                if i == 1 {
                    i += 1
                }
                i += 1
            }
        }
        self.addSubview(publishBtn)
        publishBtn.center = CGPoint.init(x: w * 0.5, y: h * 0.5)
    }
    
    func publishBtnAction() {
        
    }
    
    fileprivate lazy var publishBtn: UIButton = {
        let temp: UIButton = UIButton.init(type: .custom)
        temp.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: .normal)
        temp.setImage(UIImage(named: "tabbar_compose_icon_add"), for: .normal)
        temp.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        temp.sizeToFit()
        temp.addTarget(self, action: #selector(publishBtnAction), for: .touchUpInside)
        return temp
    }()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}



















