//
//  UIScreen.extension.swift
//  新建项目
//
//  Created by 李强 on 2017/2/15.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit

extension UIScreen{
//    class func with() -> CGFloat {
//        return UIScreen.main.bounds.width
//    }
//    
//    class func height() -> CGFloat {
//        return UIScreen.main.bounds.height
//    }
    
    class var width:CGFloat{
        get{
            return UIScreen.main.bounds.width
        }
    }
    
    class var height:CGFloat{
        get{
            return UIScreen.main.bounds.height
        }
    }
}
