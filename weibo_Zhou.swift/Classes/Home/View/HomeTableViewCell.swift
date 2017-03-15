//
//  HomeTableViewCell.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/14.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit

class WBStatusView: UIView {
    var homeStatusLayout: HomeStatusLayout? {
        didSet{
            textLabel.attributedText = homeStatusLayout?.textLayout

            if (homeStatusLayout?.isHavePic)! {
                self.addSubview(picView)
//                setPicImageView()

                picView.snp.makeConstraints({ (make) in
                    make.top.equalTo(self.textLabel.snp.bottom).offset(10)
                    make.left.bottom.right.equalToSuperview()
                })
            }else{
                textLabel.snp.makeConstraints({ (make) in
                    make.bottom.equalToSuperview()
                })
                picView.removeAllSubviews()
            }
            
        }
    }

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(textLabel)
        self.addSubview(picView)
        textLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-12)
        }
        
    }
    
    lazy var picArray: NSMutableArray = {
        let temp = NSMutableArray()
        return temp
    }()
    
    lazy var textLabel: UILabel = {
        let temp: UILabel = UILabel()
        temp.numberOfLines = 0
        return temp
    }()
    
    lazy var picView: UIView = {
        let temp = UIView()
        temp.backgroundColor = UIColor.white
        return temp
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HomeTableViewCell: UITableViewCell {
    var homeStatusLayout: HomeStatusLayout? {
        didSet {
            if homeStatusLayout != nil {
                titleView.homeStatusLayout = homeStatusLayout
                statusView.homeStatusLayout = homeStatusLayout
            }
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(margin)
        self.contentView.addSubview(titleView)
//        self.contentView.addSubview(statusView)
        margin.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(10)
        }
        titleView.snp.makeConstraints { (make) in
            make.top.equalTo(self.margin.snp.bottom)
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(55)
        }
//        statusView.snp.makeConstraints { (make) in
//            make.top.equalTo(self.titleView.snp.bottom)
//            make.left.right.bottom.equalToSuperview()
//        }
    }
    
    // MARK: - 懒加载
    //最上面的灰边
    lazy var margin: UIView = {
        let temp: UIView = UIView()
        temp.backgroundColor = RGB(r: 242, g: 242, b: 242)
        return temp
    }()
    
    lazy var titleView: WBStatusTitleView = {
        let temp: WBStatusTitleView = WBStatusTitleView.init(frame: .init(x: 0, y: self.margin.bottom, width: kScreenWidth, height: 0))
        return temp
    }()
    
    lazy var statusView: WBStatusView = {
        let temp: WBStatusView = WBStatusView(frame: CGRect.zero)
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
