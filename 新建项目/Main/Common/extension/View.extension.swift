//
//  View.extension.swift
//  新建项目
//
//  Created by 李强 on 2017/2/15.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit

extension UIView{
     var y:CGFloat{
        get{
            return frame.origin.y
        }
    }
    
    var x:CGFloat{
        get{
            return frame.origin.y
        }
    }
    
    var height:CGFloat{
        get{
            return frame.size.height
        }
    }
    
    var width:CGFloat{
        get{
            return frame.size.width
        }
    }
}
