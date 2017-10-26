//
//  HomeViewController.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/9.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit
//import GDPerformanceView_Swift
class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI() -> Void {
        let rightBtn = UIBarButtonItem.init(title: "刷新", style: .plain, target: self, action: #selector(rightClick))
        navigationItem.rightBarButtonItem = rightBtn
        view.addSubview(homeTableView)
        homeTableView.frame = view.bounds
        loadData()
    }
    
    func rightClick() {
        loadData()
    }
    
    // MARK: - View(页面处理)
    
    
    // MARK: - XXXDelegate
    
    
    // MARK: - 对外接口
    
    
    // MARK: - private methods(内部接口)
    
    
    // MARK: - loading
    func loadData() {
        homeViewModel.requestData {
            self.homeTableView.homeViewModel = self.homeViewModel
            self.homeTableView.reloadData()
        }
    }
    
    // MARK: - 懒加载
    fileprivate var homeViewModel: HomeViewModel = HomeViewModel()
    fileprivate var homeTableView: HomeTableView = {
        let temp: HomeTableView = HomeTableView(frame: CGRect.zero, style: .plain)
        return temp
    }()
    
//    lazy var performanceMoniter = GDPerformanceMonitor()
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
