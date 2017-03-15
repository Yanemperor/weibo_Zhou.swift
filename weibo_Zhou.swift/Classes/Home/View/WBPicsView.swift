//
//  WBPicsView.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/3/15.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit

class WBPicsView: UIView {

    var homeStatusLayout: HomeStatusLayout? {
        didSet {
            if homeStatusLayout != nil {
                let picCount = homeStatusLayout?.picArray.count
                if picViewArray.count > 0 {
                    for item in picViewArray {
                        let imageView = item as! UIImageView
                        imageView.removeFromSuperview()
                    }
                }
                switch picCount! {
                case 1:
                    let imageView = UIImageView()
                    imageView.contentMode = .scaleAspectFill
                    imageView.clipsToBounds = true
                    self.addSubview(imageView)
                    picViewArray.add(imageView)
                    setOneImage(imageView: imageView, url: (homeStatusLayout?.showPic)!, imageWidth: (kScreenWidth * 2 / 3))
                default:
                    return
                }
            }
        }
    }
    
    func setOneImage(imageView: UIImageView, url: String, imageWidth: CGFloat) {
        imageView.kf.setImage(with: URL.init(string: url), completionHandler: { (image, error, type, url) in
//            let imageWidth = kScreenWidth * 2 / 3
            let temp = (image?.size.width)! / imageWidth
            var imageHeight = (image?.size.height)! / temp
            if imageHeight > 300 {
                imageHeight = 300
            }
            imageView.snp.makeConstraints({ (make) in
                make.top.bottom.equalToSuperview()
                make.left.equalToSuperview().offset(10)
                make.size.equalTo(CGSize(width: imageWidth, height: imageHeight))
            })
        })
    }
    
    
    lazy var picViewArray: NSMutableArray = {
        let temp = NSMutableArray()
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
