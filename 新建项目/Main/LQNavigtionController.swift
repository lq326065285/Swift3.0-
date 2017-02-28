//
//  LQNavigtionController.swift
//  新建项目
//
//  Created by 李强 on 2017/2/6.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit

class LQNavigtionController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        guard let myViewController = viewController as? LQBaseViewController else {
            return
        }
        
        if viewControllers.count > 0 {
            var navTitle = (viewControllers[0] as! LQBaseViewController).navItem.title
            myViewController.hidesBottomBarWhenPushed = true
            if viewControllers.count > 1{
                navTitle = "上一页"
            }
            
            
//            myViewController.navItem.leftBarButtonItem = UIBarButtonItem(title: navTitle, style: .done, target: self, action: #selector(clickGoBack))
            let leftButton:UIButton = UIButton()
            leftButton.setImage(UIImage(named: "left_back"), for: .normal)
            leftButton.setTitle("返回", for: .normal)
            leftButton.contentHorizontalAlignment = .left
            leftButton.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
            myViewController.navItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        }
        
        super.pushViewController(viewController, animated: animated)
    }

    @objc func clickGoBack() {
        popViewController(animated: true)
    }
}

extension LQNavigtionController {
   
}
