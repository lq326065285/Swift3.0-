//
//  LQHomeController.swift
//  新建项目
//
//  Created by 李强 on 2017/2/6.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit

class LQHomeController: LQBaseViewController {

    var arrData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0...20 {
            arrData.append("这是第\(i)行")
        }
        
        _ = LQStudentModel().getProperties()
        LQStudentModel().getIvars()
        LQStudentModel().getMethodList()
        
        print(LQHttpSessionManager.share())
//        LQHttpSessionManager.share().request(<#T##URLString: String##String#>, parameters: <#T##[String : AnyObject]?#>, method: <#T##LQRequestMethod#>, completionHandle: <#T##((Bool, Any?) -> Void)?##((Bool, Any?) -> Void)?##(Bool, Any?) -> Void#>)
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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellTest")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellTest")
        }
        cell?.textLabel?.text = arrData[indexPath.row]
        return cell!
    }
}
