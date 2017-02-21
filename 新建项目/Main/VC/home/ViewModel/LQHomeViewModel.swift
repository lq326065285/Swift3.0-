//
//  LQHomeViewModel.swift
//  新建项目
//
//  Created by 李强 on 2017/2/21.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit

class LQHomeViewModel: NSObject {
    var dataArr:Array = [AnyObject]()
    
    /// 请求网络数据
    ///
    /// - Parameters:
    ///   - isHeaderRefresh: ture=>下拉刷新  false=>上拉加载更多
    ///   - completion: 完成之后的回调
    func request(isHeaderRefresh:Bool, completion: (()->())?) {
        var parameters = [String:AnyObject]()
        if isHeaderRefresh {
            let model = dataArr.first as? LQWeiboListModel
            parameters["since_id"] = (model != nil ? "\(model!.id)" : "0") as AnyObject
            parameters["max_id"] = "0" as AnyObject
        }else{
            let model = dataArr.last as? LQWeiboListModel
            parameters["max_id"] = (model != nil ? "\(model!.id)" : "0") as AnyObject
            parameters["since_id"] = "0" as AnyObject
        }
        
        
        LQHttpSessionManager.share().getWeiboListRequest(URLString: "", parameters: parameters, method: .GET, completionHandel: { (isSuccess, data) in
            guard let data = data else{
                return
            }
            
            var arr: Array = [AnyObject]()
            for dict in data {
                let model = LQWeiboListModel.model(with: dict)
                arr.append(model!)
            }
            
            if(isHeaderRefresh){
                self.dataArr = arr + self.dataArr
            }else{
                self.dataArr = self.dataArr + arr
            }
            
            guard let completion = completion else{
                return
            }
            completion()
        })
    }
}
