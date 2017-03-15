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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if homeViewModel != nil {
            return (homeViewModel?.dataArray.count)!
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeStatusLayout: HomeStatusLayout = homeStatusLayoutArray[indexPath.row] as! HomeStatusLayout
        if homeStatusLayout.statusCellType == .WBStatusCellNomal {
            let cell: HomeNomalCell = tableView.dequeueReusableCell(withIdentifier: "HomeNomalCell", for: indexPath) as! HomeNomalCell
            cell.homeStatusLayout = homeStatusLayout
            return cell
        }else if (homeStatusLayout.statusCellType == .WBStatusCellPic) {
            let cell: HomePicCell = tableView.dequeueReusableCell(withIdentifier: "HomePicCell", for: indexPath) as! HomePicCell
            cell.homeStatusLayout = homeStatusLayout
            return cell
        }else if (homeStatusLayout.statusCellType == .WBStatusCellRetweet) {
            let cell: HomeRetweetCell = tableView.dequeueReusableCell(withIdentifier: "HomeRetweetCell", for: indexPath) as! HomeRetweetCell
            cell.homeStatusLayout = homeStatusLayout
            return cell
        }else{
            let cell: HomeRetweetPicCell = tableView.dequeueReusableCell(withIdentifier: "HomeRetweetPicCell", for: indexPath) as! HomeRetweetPicCell
            cell.homeStatusLayout = homeStatusLayout
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.separatorStyle = .none
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 200
//        self.tableHeaderView = UIView(frame: CGRect.zero)
        self.tableFooterView = UIView(frame: CGRect.zero)
        self.register(HomeNomalCell.classForCoder(), forCellReuseIdentifier: "HomeNomalCell")
        self.register(HomePicCell.classForCoder(), forCellReuseIdentifier: "HomePicCell")
        self.register(HomeRetweetCell.classForCoder(), forCellReuseIdentifier: "HomeRetweetCell")
        self.register(HomeRetweetPicCell.classForCoder(), forCellReuseIdentifier: "HomeRetweetPicCell")
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
