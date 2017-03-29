//
//  WBStatusToolbarView.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/3/28.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit

class WBStatusToolbarView: UIView {

    var homeStatusLayout: HomeStatusLayout? {
        didSet {
            repostButton.setTitle(homeStatusLayout?.toolbarRepostTextLayout, for: .normal)
            commentButton.setTitle(homeStatusLayout?.toolbarCommentTextLayout, for: .normal)
            likeButton.setTitle(homeStatusLayout?.toolbarLikeTextLayout, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isExclusiveTouch = true
        addSubview(repostButton)
        addSubview(commentButton)
        addSubview(likeButton)
        let dark = UIColor(white: 0, alpha: 0.2)
        let clear = UIColor(white: 0, alpha: 0)
        let colors = [clear.cgColor,dark.cgColor,clear.cgColor]
        let locations = [NSNumber(value: 0.2),NSNumber(value: 0.5),NSNumber(value: 0.8)]
        let line1 = CAGradientLayer()
        line1.colors = colors
        line1.locations = locations
        line1.startPoint = CGPoint(x: 0, y: 0)
        line1.endPoint = CGPoint(x: 0, y: 1)
        line1.size = CGSize(width: CGFloatFromPixel(num: 1), height: self.height)
        line1.left = repostButton.right
        let line2 = CAGradientLayer()
        line2.colors = colors
        line2.locations = locations
        line2.startPoint = CGPoint(x: 0, y: 0)
        line2.endPoint = CGPoint(x: 0, y: 1)
        line2.size = CGSize(width: CGFloatFromPixel(num: 1), height: self.height)
        line2.left = commentButton.right
        let topLine = CALayer()
        topLine.size = CGSize(width: self.width, height: CGFloatFromPixel(num: 1))
        topLine.backgroundColor = kWBCellLineColor.cgColor
        
        let bottomLine = CALayer()
        bottomLine.size = topLine.size
        bottomLine.bottom = self.height
        bottomLine.backgroundColor = UIColor(hexString: "e8e8e8")?.cgColor
        self.layer.addSublayer(line1)
        self.layer.addSublayer(line2)
        self.layer.addSublayer(topLine)
        self.layer.addSublayer(bottomLine)
    }
    
    lazy var repostButton: UIButton = {
        let temp: UIButton = UIButton(frame: .init(x: 0, y: 0, width: kScreenWidth / 3.0, height: self.height))
        temp.backgroundColor = UIColor.white
        temp.isExclusiveTouch = true
        temp.setBackgroundImage(UIImage.init(color: kWBCellHighlightColor!), for: .highlighted)
        temp.setImage(kImage(imageName: "timeline_icon_retweet"), for: .normal)
        temp.setTitle("转发", for: .normal)
        temp.setTitleColor(kWBCellTextSubTitleColor, for: .normal)
        temp.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        temp.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5)
        return temp
    }()
    
    lazy var commentButton: UIButton = {
        let temp: UIButton = UIButton(frame: .init(x: kScreenWidth / 3.0, y: 0, width: kScreenWidth / 3.0, height: self.height))
        temp.backgroundColor = UIColor.white
        temp.isExclusiveTouch = true
        temp.setBackgroundImage(UIImage.init(color: kWBCellHighlightColor!), for: .highlighted)
        temp.setImage(kImage(imageName: "timeline_icon_comment"), for: .normal)
        temp.setTitle("评论", for: .normal)
        temp.setTitleColor(kWBCellTextSubTitleColor, for: .normal)
        temp.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        temp.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5)
        return temp
    }()
    
    lazy var likeButton: UIButton = {
        let temp: UIButton = UIButton(frame: .init(x: kScreenWidth / 3.0 * 2, y: 0, width: kScreenWidth / 3.0, height: self.height))
        temp.backgroundColor = UIColor.white
        temp.isExclusiveTouch = true
        temp.setBackgroundImage(UIImage.init(color: kWBCellHighlightColor!), for: .highlighted)
        temp.setImage(kImage(imageName: "timeline_icon_like_disable"), for: .normal)
        temp.setTitle("赞", for: .normal)
        temp.setTitleColor(kWBCellTextSubTitleColor, for: .normal)
        temp.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        temp.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5)
        return temp
    }()
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
