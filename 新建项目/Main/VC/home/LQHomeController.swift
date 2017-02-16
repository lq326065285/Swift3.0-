//
//  LQHomeController.swift
//  新建项目
//
//  Created by 李强 on 2017/2/6.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit

class LQHomeController: LQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _ = LQStudentModel().getProperties()
        LQStudentModel().getIvars()
        LQStudentModel().getMethodList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
