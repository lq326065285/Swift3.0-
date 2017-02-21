//
//  LQMineController.swift
//  新建项目
//
//  Created by 李强 on 2017/2/6.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit

class LQMineController: LQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupTableView() {
        super.setupTableView()
        tableView.register(LQMineTableViewCell.self, forCellReuseIdentifier: "mineTableViewCell")
    }

}

extension LQMineController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableViewCell:LQMineTableViewCell = tableView.dequeueReusableCell(withIdentifier: "mineTableViewCell") as! LQMineTableViewCell
        return tableViewCell.getCellHeight(model: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell:LQMineTableViewCell = tableView.dequeueReusableCell(withIdentifier: "mineTableViewCell") as! LQMineTableViewCell
        tableViewCell.setModel(model: nil)
        return tableViewCell
    }
    
}
