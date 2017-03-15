//
//  HomeNomalCell.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/3/14.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit

class HomeNomalCell: UITableViewCell {

    var homeStatusLayout: HomeStatusLayout? {
        didSet {
            if homeStatusLayout != nil {
                titleView.homeStatusLayout = homeStatusLayout
                textLabels.attributedText = homeStatusLayout?.textLayout
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(margin)
        self.contentView.addSubview(titleView)
        self.contentView.addSubview(textLabels)
        margin.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(10)
        }
        titleView.snp.makeConstraints { (make) in
            make.top.equalTo(self.margin.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(55)
        }
        textLabels.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview()
        }
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
    
    lazy var textLabels: UILabel = {
        let temp: UILabel = UILabel()
        temp.numberOfLines = 0
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
