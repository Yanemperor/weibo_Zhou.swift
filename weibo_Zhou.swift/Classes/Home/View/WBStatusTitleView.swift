//
//  WBStatusTitleView.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/3/14.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit
import YYText

class WBStatusTitleView: UIView {
    var homeStatusLayout: HomeStatusLayout? {
        didSet {
            if homeStatusLayout?.vipBackgroundImageURL != nil {
                self.addSubview(vipBackgroundView)
                let vipUrl: URL = URL(string: (homeStatusLayout?.vipBackgroundImageURL)!)!
                vipBackgroundView.kf.setImage(with: vipUrl)
                if (homeStatusLayout?.mbrank)! > 0 {
                    if (homeStatusLayout?.isVIP)! {
                        vipBackgroundView.size = CGSize.init(width: kScreenWidth, height: 14)
                    }else{
                        vipBackgroundView.size = CGSize.init(width: kScreenWidth, height: 35)
                    }
                }
            }else{
                vipBackgroundView.removeFromSuperview()
            }
            
            headView.kf.setImage(with: homeStatusLayout?.headViewURL)
            headView.kf.setImage(with: homeStatusLayout?.headViewURL) { (image, error, type, url) in
                self.headView.image = self.headView.image?.kf.image(withRoundRadius: (image?.size.width)! / 2.0, fit: (image?.size)!)
            }
            if homeStatusLayout?.userVerifyType == WBUserVerifyType.WBUserVerifyTypeOrganization {
                avatarBadgeView.image = setRoundedCorners(image: UIImage(named: "avatar_enterprise_vip")!)
            }else if homeStatusLayout?.userVerifyType == WBUserVerifyType.WBUserVerifyTypeClub {
                avatarBadgeView.image = setRoundedCorners(image: UIImage(named: "avatar_grassroot")!)
            }else if homeStatusLayout?.userVerifyType == WBUserVerifyType.WBUserVerifyTypeStandard {
                avatarBadgeView.image = setRoundedCorners(image: UIImage(named: "avatar_vip")!)
            }else{
                avatarBadgeView.image = setRoundedCorners(image: UIImage(named: "avatar_vip")!)
            }
            nameLabel.textColor = (homeStatusLayout?.mbrank)! > 4 ? kWBCellNameOrangeColor : kWBCellNameNormalColor
            if (homeStatusLayout?.mbrank)! >= 5 {
                let text: NSMutableAttributedString = NSMutableAttributedString.init(string: (homeStatusLayout?.nameTextLayout)!)
                let font: UIFont = UIFont.systemFont(ofSize: CGFloat(kWBCellNameFontSize))
                text.addAttribute(NSFontAttributeName, value: font, range: NSMakeRange(0, text.length))
                let color: UIColor = kWBCellNameOrangeColor!
                text.addAttribute(NSForegroundColorAttributeName, value: color, range: NSMakeRange(0, text.length))
                let attachment: NSMutableAttributedString?
                var image: UIImage = UIImage(named: "common_icon_membership_level5")!
                if (homeStatusLayout?.mbrank)! >= 6 {
                    image = UIImage(named: "common_icon_membership_level6")!
                }
                attachment = NSMutableAttributedString.yy_attachmentString(withContent: image, contentMode: UIViewContentMode.center, attachmentSize: image.size, alignTo: font, alignment: YYTextVerticalAlignment.center)
                text.append(attachment!
                )
                nameLabel.attributedText = text
            }else{
                nameLabel.text = homeStatusLayout?.nameTextLayout
            }
            sourceLabel.text = homeStatusLayout?.sourceTextLayout
        }
    }
    
    func setRoundedCorners(image: UIImage) -> UIImage {
        return image.kf.image(withRoundRadius: image.size.width / 2.0, fit: image.size)
    }
    
    func timelineClick() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(headView)
        self.addSubview(avatarBadgeView)
        self.addSubview(nameLabel)
        self.addSubview(sourceLabel)
        self.addSubview(timeline)
        headView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(15)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        avatarBadgeView.snp.makeConstraints { (make) in
            make.right.equalTo(self.headView.snp.right)
            make.bottom.equalTo(self.headView.snp.bottom)
            make.size.equalTo(CGSize(width: 14, height: 14))
        }
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.headView.snp.right).offset(14)
            make.top.equalToSuperview().offset(17)
            make.right.equalToSuperview().offset(-14)
        }
        sourceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.nameLabel.snp.left)
            make.bottom.equalTo(self.headView.snp.bottom)
            make.right.equalToSuperview().offset(-14)
        }
        timeline.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.size.equalTo(CGSize(width: 15, height: 15))
        }
    }
    
    lazy var vipBackgroundView: UIImageView = {
        let temp: UIImageView = UIImageView.init(frame: .init(x: 0, y: 0, width: kScreenWidth, height: 0))
        temp.backgroundColor = UIColor.clear
        return temp
    }()
    
    lazy var headView: UIImageView = {
        let temp: UIImageView = UIImageView()
        temp.backgroundColor = UIColor.white
        temp.isOpaque = true
        return temp
    }()
    
    lazy var avatarBadgeView: UIImageView = {
        let temp: UIImageView = UIImageView()
        temp.backgroundColor = UIColor.clear
        temp.isOpaque = true
        temp.contentMode = .scaleAspectFit
        return temp
    }()
    
    lazy var nameLabel: UILabel = {
        let temp: UILabel = UILabel()
        temp.backgroundColor = UIColor.white
        temp.textColor = UIColor.orange
        temp.textAlignment = NSTextAlignment.left
        temp.font = UIFont.systemFont(ofSize: 18.0)
        temp.layer.masksToBounds = true
        return temp
    }()
    
    lazy var sourceLabel: UILabel = {
        let temp: UILabel = UILabel()
        temp.backgroundColor = UIColor.white
        temp.textColor = kWBCellTimeNormalColor
        temp.textAlignment = NSTextAlignment.left
        temp.font = UIFont.systemFont(ofSize: CGFloat(kWBCellSourceFontSize))
        temp.layer.masksToBounds = true
        return temp
    }()
    
    lazy var timeline: UIButton = {
        let temp: UIButton = UIButton()
        temp.backgroundColor = UIColor.white
        temp.isExclusiveTouch = true
        temp.isOpaque = true
        temp.setImage(kImage(imageName: "timeline_icon_more"), for: .normal)
        temp.setImage(kImage(imageName: "timeline_icon_more_highlighted"), for: .highlighted)
        temp.addTarget(self, action: #selector(timelineClick), for: .touchUpInside)
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
