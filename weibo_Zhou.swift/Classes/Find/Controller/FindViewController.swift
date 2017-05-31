//
//  FindViewController.swift
//  weibo_Zhou.swift
//
//  Created by zzl on 2017/2/9.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit
import WebKit

class FindViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI() -> Void {
//        view.addSubview(tableView)
        view.addSubview(webView)
        let url = URL(string: "https://www.baidu.com")
        let request = URLRequest(url: url!)
        webView.load(request)
        navigationController?.navigationBar.addSubview(progressView)
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)   
    }
    
    // MARK: - View(页面处理)
    
    
    // MARK: - XXXDelegate
    
    
    // MARK: - 对外接口
    
    
    // MARK: - private methods(内部接口)
    deinit {
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
        progressView.reloadInputViews()
    }
    
    // MARK: - loading
    
    
    // MARK: - 懒加载
    
    
    lazy var webView: WKWebView = {
        let temp: WKWebView = WKWebView(frame: self.view.bounds)
        temp.backgroundColor = UIColor.white
        temp.navigationDelegate = self
        temp.uiDelegate = self
        return temp
    }()
    
    lazy var progressView: UIProgressView = {
        let temp: UIProgressView = UIProgressView(frame: CGRect(x: 0, y: 44 - 2, width: kScreenWidth, height: 2))
        temp.trackTintColor = UIColor.white
        temp.progressTintColor = UIColor.orange
        return temp
    }()
    
    fileprivate lazy var tableView: UITableView = {
        let temp: UITableView = UITableView.init(frame: self.view.bounds, style: .plain)
        temp.backgroundColor = UIColor.white
        temp.delegate = self
        temp.dataSource = self
        temp.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return temp
    }()

}

extension FindViewController : WKNavigationDelegate, WKUIDelegate {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.isHidden = webView.estimatedProgress == 1
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
            print(webView.estimatedProgress)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.setProgress(0.0, animated: false)
        self.navigationItem.title = webView.title
    }
    
}












extension FindViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}














