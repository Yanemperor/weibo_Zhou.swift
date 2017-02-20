//
//  HomeTableViewCell.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/14.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit
class WBStatusTitleView: UIView {
    var homeStatusLayout: HomeStatusLayout? {
        didSet {
            if homeStatusLayout?.vipBackgroundImageURL != nil {
                self.addSubview(vipBackgroundView)
                let vipUrl: URL = URL(string: (homeStatusLayout?.vipBackgroundImageURL)!)!
                vipBackgroundView.sd_setImage(with: vipUrl)
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
            headView.sd_setImage(with: homeStatusLayout?.headViewURL)
            
            if homeStatusLayout?.userVerifyType == WBUserVerifyType.WBUserVerifyTypeOrganization {
                avatarBadgeView.image = kImage(imageName: "avatar_enterprise_vip")
            }else if homeStatusLayout?.userVerifyType == WBUserVerifyType.WBUserVerifyTypeClub {
                avatarBadgeView.image = kImage(imageName: "avatar_grassroot")
            }else if homeStatusLayout?.userVerifyType == WBUserVerifyType.WBUserVerifyTypeStandard {
                avatarBadgeView.image = kImage(imageName: "avatar_vip")
            }else{
                avatarBadgeView.image = kImage(imageName: "avatar_vip")
            }
            nameLabel.text = homeStatusLayout?.nameTextLayout
            nameLabel.textColor = (homeStatusLayout?.mbrank)! > 4 ? kWBCellNameOrangeColor : kWBCellNameNormalColor
            sourceLabel.text = homeStatusLayout?.sourceTextLayout
        }
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
        
    }
    
    lazy var vipBackgroundView: UIImageView = {
        let temp: UIImageView = UIImageView.init(frame: .init(x: 0, y: 0, width: kScreenWidth, height: 0))
        temp.backgroundColor = UIColor.clear
        return temp
    }()
    
    lazy var headView: UIImageView = {
        let temp: UIImageView = UIImageView.init(frame: .init(x: 12, y: 15, width: 40, height: 40))
        temp.backgroundColor = UIColor.white
        temp.layer.masksToBounds = true
        temp.layer.cornerRadius = temp.height / 2.0
        temp.layer.borderWidth = 0.5
        temp.layer.borderColor = UIColor.init(white: 0.000, alpha: 0.090).cgColor
        temp.layer.shouldRasterize = true
        temp.layer.rasterizationScale = UIScreen.main.scale
        return temp
    }()
    
    lazy var avatarBadgeView: UIImageView = {
        let temp: UIImageView = UIImageView.init(frame: .init(x: self.headView.right - 12, y: self.headView.bottom - 14, width: 14, height: 14))
        temp.layer.masksToBounds = true
        temp.layer.cornerRadius = temp.height / 2.0
        temp.layer.borderWidth = 0.5
        temp.layer.borderColor = UIColor.init(white: 0.000, alpha: 0.090).cgColor
        temp.layer.shouldRasterize = true
        temp.layer.rasterizationScale = UIScreen.main.scale
        return temp
    }()
    
    lazy var nameLabel: UILabel = {
        let temp: UILabel = UILabel.init(frame: .init(x: 66, y: 15, width: kScreenWidth - 110, height: 24))
        temp.textColor = UIColor.orange
        temp.textAlignment = NSTextAlignment.left
        temp.font = UIFont.systemFont(ofSize: 18.0)
        return temp
    }()
    
    lazy var sourceLabel: UILabel = {
        let temp: UILabel = UILabel.init(frame: .init(x: 66, y: self.nameLabel.bottom, width: kScreenWidth - 110, height: 16))
        temp.textColor = kWBCellTimeNormalColor
        temp.textAlignment = NSTextAlignment.left
        temp.font = UIFont.systemFont(ofSize: 13.0)
        return temp
    }()
    
    lazy var timeline: UIButton = {
        let temp: UIButton = UIButton.init(frame: .init(x: kScreenWidth - 35, y: 5, width: 30, height: 30))
        temp.isExclusiveTouch = true
        temp.setImage(kImage(imageName: "timeline_icon_more"), for: .normal)
        temp.setImage(kImage(imageName: "timeline_icon_more_highlighted"), for: .highlighted)
        temp.addTarget(self, action: #selector(timelineClick), for: .touchUpInside)
        return temp
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




class HomeTableViewCell: UITableViewCell {

    var homeStatusLayout: HomeStatusLayout? {
        didSet {
            self.contentView.addSubview(margin)
            self.contentView.addSubview(titleView)
            if homeStatusLayout != nil {
                titleView.homeStatusLayout = homeStatusLayout
            }
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    // MARK: - 懒加载
    //最上面的灰边
    lazy var margin: UIView = {
        let temp: UIView = UIView(frame: .init(x: 0, y: 0, width: kScreenWidth, height: self.homeStatusLayout!.marginTop))
        temp.backgroundColor = RGB(r: 242, g: 242, b: 242)
        return temp
    }()
    
    lazy var titleView: WBStatusTitleView = {
        let temp: WBStatusTitleView = WBStatusTitleView.init(frame: .init(x: 0, y: self.margin.bottom, width: kScreenWidth, height: 14))
        return temp
    }()
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
