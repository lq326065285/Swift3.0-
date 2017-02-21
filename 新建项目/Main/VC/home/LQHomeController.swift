//
//  LQHomeController.swift
//  新建项目
//
//  Created by 李强 on 2017/2/6.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit
import SnapKit
import YYKit
class LQHomeController: LQBaseViewController {

    var viewModel:LQHomeViewModel = LQHomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        //关于运行时测试
        _ = LQStudentModel().getProperties()
        LQStudentModel().getIvars()
        LQStudentModel().getMethodList()
        
        //请求数据
        viewModel.request(isHeaderRefresh: true) {[weak self] in
            self?.tableView.reloadData()
        }
    }

    override func setupTableView() {
        super.setupTableView()
        self.navItem.rightBarButtonItem = UIBarButtonItem(title: "测试", style: .plain, target: self, action: #selector(clickRight))
    }
    
    
    //MARK: - action
    func clickRight(item:UIBarButtonItem) -> Void {
        let testVC = LQTestViewController()
        navigationController?.pushViewController(testVC, animated: true)
    }


}

extension LQHomeController{
    
    override func headerRefresh() {
        self.viewModel.dataArr.removeAll()
        viewModel.request(isHeaderRefresh: true) { [weak self] in
            self?.tableView.reloadData()
            self?.tableView.mj_header.endRefreshing()
        }
    }
    
    override func footerRefresh() {
        viewModel.request(isHeaderRefresh: false) { [weak self] in
            self?.tableView.reloadData()
            self?.tableView.mj_footer.endRefreshing()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrData.count
        return viewModel.dataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellTest")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellTest")
        }
        let model = viewModel.dataArr[indexPath.row] as? LQWeiboListModel
        cell?.textLabel?.text = model?.text
        cell?.detailTextLabel?.text = model?.created_at
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
