//
//  LQBaseViewController.swift
//  新建项目
//
//  Created by 李强 on 2017/2/6.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit
import MJRefresh
class LQBaseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //自定义naviItem
    let navItem = UINavigationItem();
    var myMessage:String = ""
    let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height:64))
    
    /// false==显示访客视图    true==显示视图
    private var isLogin = false
    
    var tableView = UITableView(frame: CGRect(x:0, y: 64, width: UIScreen.width, height: UIScreen.height - 64), style: .plain)
    var name: String?{
        didSet(name){
            navItem.title = title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        isLogin ? setupTableView() : setupUI()        
    }
    
    private func setupNavigationBar(){
        navigationBar.items = [navItem]
        view.addSubview(navigationBar)
        navigationBar.barTintColor = UIColor.gray
        navigationBar.tintColor = UIColor.orange
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.black]
    }
    
    private func setupUI() {
        navItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .done, target: self, action: #selector(clickRegister))
        navItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .done, target: self, action: #selector(clickLogin))
       
        
        let visitorView:LQVisitorView = LQVisitorView(frame: CGRect(x: 0, y: 0, width: UIScreen.width, height: UIScreen.height))
        visitorView.message = myMessage
        view.insertSubview(visitorView, belowSubview: navigationBar)
        visitorView.loginButton.addTarget(self, action: #selector(clickLogin), for: .touchUpInside)
        visitorView.reigisterButton.addTarget(self, action: #selector(clickRegister), for: .touchUpInside)
        
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
    }
    
    func setupTableView()  {
        view.insertSubview(UIView(), belowSubview: navigationBar)
        print("1111")
        view.insertSubview(tableView, belowSubview: navigationBar)
        tableView.delegate = self
        tableView.dataSource = self
        addTableViewRefresh()
    }
    
    
    
    //MARK: - button action
    
    @objc func clickRegister() {
        print("注册")
    }
    
    @objc func clickLogin() {
        print("登录")
        let loginVC = LQLoginViewController()
        //登录界面不存在未登录状态了
        loginVC.isLogin = true
        navigationController?.pushViewController(loginVC, animated: true)
    }
    

}


extension LQBaseViewController{
    func addTableViewRefresh() {
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { [weak self] in
            self?.headerRefresh()
        })
        
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
            self.footerRefresh()
        })
    }
    
    func headerRefresh() {
        tableView.mj_header.endRefreshing()
    }
    
    func footerRefresh() {
        tableView.mj_header.endRefreshing()
    }
    
}
