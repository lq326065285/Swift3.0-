//
//  LQHttpSessionManager.swift
//  新建项目
//
//  Created by 李强 on 2017/2/20.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit
import AFNetworking

enum LQRequestMethod {
    case GET
    case POST
}

class LQHttpSessionManager: AFHTTPSessionManager {
    
    var access_key:String? = ""
    
   static let m = LQHttpSessionManager()
    class func share() -> LQHttpSessionManager {
        return m
    }
    
//    ((URLSessionDataTask, Any?) -> Swift.Void)?
    
    
    /// 处理 access_key
    ///
    /// - Parameters:
    ///   - URLString: 请求链接URL
    ///   - parameters: 请求参数
    ///   - method: .GET/.POST
    ///   - completionHandle: 回调
    func dealWithAccessToken(_ URLString: String, parameters: [String:AnyObject]?, method:LQRequestMethod,completionHandle:((Bool,Any?)->Void)?) {
        
        if access_key == nil {
            if completionHandle != nil {
                completionHandle!(false,"请重新登录")
            }
            return
        }
        
        var parameters = parameters
        if parameters == nil{
            parameters = [String:AnyObject]()
        }
       parameters?["access_key"] = access_key as AnyObject
    }
    
    /// 封装get和post方法
    ///
    /// - Parameters:
    ///   - URLString: 请求链接URL
    ///   - parameters: 请求参数
    ///   - method: .GET/.POST
    ///   - completionHandle: 回调
    func request(_ URLString: String, parameters: [String:AnyObject]?, method:LQRequestMethod,completionHandle:((Bool,Any?)->Void)?) {
        let success = { (task:URLSessionTask, data:Any?) in
            guard let completionHandle = completionHandle
            else {
                return
            }
            
            if data == nil {
                completionHandle(false,nil)
            }else{
                completionHandle(true,data)
            }
        }
        
        let failure = {(task:URLSessionTask?,error:Error)in
            guard let completionHandle = completionHandle  else {
                return
            }
            completionHandle(false,error)
        }
        
        if method == .GET {
            get(URLString, parameters: parameters!, progress: nil, success: success, failure: failure)
        }else if(method == .POST){
            post(URLString, parameters: parameters!, progress: nil, success: success, failure: failure)
        }
    }
    

    
}
