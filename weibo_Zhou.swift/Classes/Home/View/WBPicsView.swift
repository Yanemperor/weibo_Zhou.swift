//
//  WBPicsView.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/3/15.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit
import SnapKit
class WBPicsView: UIView {

    var homeStatusLayout: HomeStatusLayout? {
        didSet {
            if homeStatusLayout != nil {
                let picCount = homeStatusLayout?.picArray.count
                contentView.size = (homeStatusLayout?.picSize)!
                setImageHidden(number: picCount!)
                let smallPicWidth: CGFloat = (kScreenWidth - 2 * (kWBCellPaddingPic + kWBCellPadding)) / 3.0
                switch picCount! {
                case 1:
                    let imageView = picArray[1]
                    imageView.isHidden = false
                    imageView.origin = CGPoint(x: 0, y: 0)
                    imageView.size = contentView.size
                    imageView.kf.setImage(with: URL.init(string: (homeStatusLayout?.showPic)!), completionHandler: { (image, error, type, url) in
                        let imageWidth = imageView.height / (image?.size.height)! * (image?.size.width)!
                        imageView.size = CGSize(width: imageWidth, height: imageView.height)
                        if imageView.width > kScreenWidth - 2 * kWBCellPadding {
                            imageView.size = CGSize(width: kScreenWidth - 2 * kWBCellPadding, height: imageView.height)
                        }
                    })
                case 2,3:
                    for item in 0..<picCount! {
                        let imageView = picArray[item]
                        imageView.size = CGSize(width: smallPicWidth, height: smallPicWidth)
                        imageView.origin = CGPoint(x: CGFloat(item) * (imageView.width + kWBCellPaddingPic), y: 0)
                        imageView.kf.setImage(with: URL.init(string: (homeStatusLayout?.picArray[item]) as! String))
                    }
                case 4,5,6,7,8,9:
                    for item in 0..<picCount! {
                        let imageView = picArray[item]
                        imageView.size = CGSize(width: smallPicWidth, height: smallPicWidth)
                        imageView.origin = CGPoint(x: CGFloat(item % 3) * (imageView.width + kWBCellPaddingPic), y: CGFloat(item / 3) * (imageView.width + kWBCellPaddingPic))
                        imageView.kf.setImage(with: URL.init(string: (homeStatusLayout?.picArray[item]) as! String))
                    }
                    
                default:
                    return
                }
            }
        }
    }
    
    func setImageHidden(number: Int) {
        for item in picArray {
            item.size = CGSize.zero
            item.isHidden = true
        }
        
        for item in 0..<number {
            let imageView: UIImageView = picArray[item]
            imageView.isHidden = false
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(contentView)
        
        for _ in 0..<9 {
            let imageView: UIImageView = UIImageView()
            imageView.size = CGSize.zero
            imageView.isHidden = true
            imageView.clipsToBounds = true
            imageView.backgroundColor = UIColor.lightGray
            imageView.isExclusiveTouch = true
            picViewArray.add(imageView)
            contentView.addSubview(imageView)
            picArray.append(imageView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var sizeConstraint: Constraint?

    lazy var picViewArray: NSMutableArray = {
        let temp = NSMutableArray()
        return temp
    }()

    lazy var picArray: Array<UIImageView> = {
        let temp = Array<UIImageView>()
        return temp
    }()
    
    lazy var contentView: UIView = {
        let temp: UIView = UIView()
        temp.origin = CGPoint(x: kWBCellPadding, y: 0)
        temp.width = kScreenWidth - 2 * kWBCellPadding
        temp.height = 1
        temp.backgroundColor = UIColor.white
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
