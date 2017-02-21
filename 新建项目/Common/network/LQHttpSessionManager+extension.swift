//
//  LQHttpSessionManager+requestMethod.swift
//  新建项目
//
//  Created by 李强 on 2017/2/20.
//  Copyright © 2017年 李强. All rights reserved.
//

import Foundation

extension LQHttpSessionManager{
    
    /// 获得微博列表
    ///
    /// - Parameters:
    ///   - URLString: 请求链接
    ///   - parameters: 参数dict
    ///   - method: .GET/.POST
    ///   - completionHandel: 完成之后的回调
    func getWeiboListRequest(URLString:String,parameters:[String:AnyObject]?,method:LQRequestMethod,completionHandel:((_ isSuccess:Bool,_ data:[[String:AnyObject]]?)->Void)?) {
        
        let myURLStr = "https://api.weibo.com/2/statuses/friends_timeline.json"
        dealWithAccessToken(myURLStr, parameters: parameters, method: method) { (isSuccess, data) in
            guard let completionHandel = completionHandel else{
                return;
            }
            guard let data = data else{
                completionHandel(true, nil)
                return;
            }
            let dict = data as! Dictionary<String, AnyObject>
            completionHandel(isSuccess,dict["statuses"] as! [[String : AnyObject]]?);
        }
    }
}
