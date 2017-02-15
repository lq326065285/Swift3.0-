//
//  LQStudentModel.swift
//  新建项目
//
//  Created by 李强 on 2017/2/14.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit

class LQStudentModel: NSObject {
    let name:String?
    let age:String?
    override init() {
        name = "liqiang"
        age = "14"
        super.init()
    }
    
    func getProperties() -> Array<Any> {
        var count:UInt32 = 0
        let list = class_copyPropertyList(LQStudentModel.self, &count)
        for i in 0..<count {
            guard let property_t:objc_property_t = list?[Int(i)],
            let property_name = property_getName(property_t),
            let name =  NSString(utf8String: property_name) else {
                return []
            }
            print(name)
        }
        
        return []
    }
    
    //获得类的成员变量
    func getIvars() {
        
        var count:UInt32 = 0
        let list = class_copyIvarList(LQStudentModel.self, &count)
        for i in 0..<count {
            
            guard let ivar:Ivar = list?[Int(i)],
            let ivar_name = ivar_getName(ivar),
            let name = String(utf8String: ivar_name)
            else {
                return
            }
            print(name)
        }
    }
    
    //获得类里面的方法
    func getMethodList(){
        var count:UInt32 = 0
        let list = class_copyMethodList(LQStudentModel.self, &count)
        for i in 0..<count {
            guard let method:Method = list?[Int(i)],
                let method_name = method_getName(method)
            else {
                return
            }
            print(method_name)
        }
    }
}
