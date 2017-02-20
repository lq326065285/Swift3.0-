//
//  LQHttpSessionManager+requestMethod.swift
//  新建项目
//
//  Created by 李强 on 2017/2/20.
//  Copyright © 2017年 李强. All rights reserved.
//

import Foundation

extension LQHttpSessionManager{
    func getHomeRequest(URLString:String,parameters:[String:AnyObject]?,method:LQRequestMethod,completionHandel:((_ isSuccess:Bool,_ data:Any?)->Void)?) {
        
        dealWithAccessToken(URLString, parameters: parameters, method: method) { (isSuccess, data) in
            guard let completionHandel = completionHandel else{
                return;
            }
            completionHandel(isSuccess,data);
        }
    }
}
