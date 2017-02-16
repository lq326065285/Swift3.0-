//
//  Bundle.extension.swift
//  新建项目
//
//  Created by 李强 on 2017/2/13.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit
extension Bundle{
    class func bundleName()->String{
        return main.infoDictionary!["CFBundleName"] as! String
    }
}
