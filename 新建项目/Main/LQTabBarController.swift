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
        /*
        let arr = [
                ["title":"首页","className":"LQHomeController","image":"home","message":"这是首页，这是首页，这是首页，这是首页，这是首页，这是首页，这是首页，这是首页，这是首页"],
                ["title":"消息","className":"LQMessageController","image":"message","message":"这是消息页，这是消息页，这是消息页，这是消息页，这是消息页，这是消息页，这是消息页，这是消息页"],
                ["title":"发现","className":"LQDiscoverController","image":"discover","message":"这是发现页，这是发现页，这是发现页，这是发现页，这是发现页，这是发现页"],
                ["title":"我的","className":"LQMineController","image":"mine","message":"这是个人中心页，这是个人中心页，这是个人中心页，这是个人中心页，这是个人中心页，这是个人中心页，这是个人中心页"],
        ]
        let data = try? JSONSerialization.data(withJSONObject: arr, options: .prettyPrinted)
        try? data?.write(to: NSURL.fileURL(withPath: "/Users/liqiang/Desktop/main.json"), options: [])
        */
        
        //实现配置文件json化    以实现动态布局
        /*
         *此处可以现在在网络上请求，如果没有最新的就用本地main.json 如果有最新的就覆盖本地的main.json实现动态布局
         */
        let path:String? = Bundle.main.path(forResource: "main", ofType: "json")
        let data = NSData.init(contentsOfFile: path!) as? Data
        guard let arr = try? JSONSerialization.jsonObject(with: data!, options: []) as! [[String:String]] else {
            return
        }
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
