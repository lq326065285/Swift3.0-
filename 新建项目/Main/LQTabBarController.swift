//
//  LQTabBarViewController.swift
//  新建项目
//
//  Created by 李强 on 2017/2/6.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit

class LQTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      setRootViewController();
        
    }

}


extension LQTabBarController{
    func setRootViewController(){
        let arr = [
                ["title":"首页","className":"LQHomeController","image":"home","message":"这是首页，这是首页，这是首页，这是首页，这是首页，这是首页，这是首页，这是首页，这是首页"],
                ["title":"消息","className":"LQMessageController","image":"message","message":"这是消息页，这是消息页，这是消息页，这是消息页，这是消息页，这是消息页，这是消息页，这是消息页"],
                ["title":"发现","className":"LQDiscoverController","image":"discover","message":"这是发现页，这是发现页，这是发现页，这是发现页，这是发现页，这是发现页"],
                ["title":"我的","className":"LQMineController","image":"mine","message":"这是个人中心页，这是个人中心页，这是个人中心页，这是个人中心页，这是个人中心页，这是个人中心页，这是个人中心页"],
        ]
        
//        let date = try? JSONSerialization.data(withJSONObject: arr, options: .prettyPrinted)
//        try? date?.write(to: NSURL.fileURL(withPath: "/Users/liqiang/Desktop/main.json"), options: [])
        
        var arrChild = [LQNavigtionController]();
        for dict in arr {
            arrChild.append(setViewController(dict: dict))
        }
        viewControllers = arrChild
    }
    
    func setViewController(dict:Dictionary<String, String>) -> LQNavigtionController{
        
//        print(Bundle.main.infoDictionary)
        
        guard let title = dict["title"],
            let image = dict["image"],
            let className = dict["className"],
            let message = dict["message"]
            ,let cls = NSClassFromString(Bundle.bundleName() + "." + className) as? LQBaseViewController.Type
            else {
                return LQNavigtionController();
        }
        
        let vc = cls.init();
        vc.title = title;
        vc.name = title;
        vc.myMessage = message;
        vc.tabBarItem.image = UIImage(named: image)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        vc.tabBarItem.selectedImage = UIImage(named:image + "_highted")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        tabBar.tintColor = UIColor.orange
        let navigationVC = LQNavigtionController(rootViewController: vc);
        return navigationVC;
    }
    
}
