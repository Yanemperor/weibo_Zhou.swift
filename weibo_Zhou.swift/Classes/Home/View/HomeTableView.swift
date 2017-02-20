//
//  HomeTableView.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/14.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit

class HomeTableView: UITableView, UITableViewDataSource, UITableViewDelegate {

    var homeViewModel: HomeViewModel? {
        didSet {
            homeStatusLayoutArray.removeAllObjects()
            for homeModel in (homeViewModel?.dataArray)! {
                let homeStatusLayout: HomeStatusLayout = HomeStatusLayout()
                homeStatusLayout.homeModel = homeModel as? HomeModel
                homeStatusLayoutArray.add(homeStatusLayout)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let homeStatusLayout: HomeStatusLayout = homeStatusLayoutArray[indexPath.row] as! HomeStatusLayout
        return homeStatusLayout.height
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if homeViewModel != nil {
            return (homeViewModel?.dataArray.count)!
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.homeStatusLayout = homeStatusLayoutArray[indexPath.row] as? HomeStatusLayout
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.separatorStyle = .none
//        self.tableHeaderView = UIView(frame: CGRect.zero)
        self.tableFooterView = UIView(frame: CGRect.zero)
        self.register(HomeTableViewCell.classForCoder(), forCellReuseIdentifier: "HomeTableViewCell")
        return
    }
    
    var homeStatusLayoutArray: NSMutableArray = NSMutableArray()
    
    
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
