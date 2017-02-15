//
//  LQVisitorView.swift
//  新建项目
//
//  Created by 李强 on 2017/2/15.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit

class LQVisitorView: UIView {

    let loginButton = UIButton()
    let reigisterButton = UIButton()
    let titleLabel:UILabel = UILabel.lq_label(withFrame: CGRect(), title: "大师的水电费水电费", font: 15, textColor: UIColor.black, textAlignment: .center)
    var message:String?{
        didSet{
            titleLabel.text = message
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        loginButton.setTitle("登录", for: .normal)
        loginButton.backgroundColor = UIColor.orange
        addSubview(loginButton)
        
        reigisterButton.setTitle("注册", for: .normal)
        reigisterButton.backgroundColor = UIColor.orange
        addSubview(reigisterButton)
        
        addSubview(titleLabel)
        
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //登录按钮
        addConstraint(NSLayoutConstraint(item: loginButton,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: loginButton,
                                        attribute: .centerY,
                                        relatedBy: .equal,
                                        toItem: self,
                                        attribute: .centerY,
                                        multiplier: 1.0,
                                        constant: 0))
        addConstraint(NSLayoutConstraint(item: loginButton,
                                        attribute: .width,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .width,
                                        multiplier: 1.0,
                                        constant: 100))
        addConstraint(NSLayoutConstraint(item: loginButton,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .height,
                                        multiplier: 1.0,
                                        constant: 40))
        
        
        //注册按钮
        addConstraint(NSLayoutConstraint(item: reigisterButton,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: reigisterButton,
                                         attribute: .bottom,
                                         relatedBy: .equal,
                                         toItem: loginButton,
                                         attribute: .top,
                                         multiplier: 1.0,
                                         constant: -20))
        addConstraint(NSLayoutConstraint(item: reigisterButton,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .width,
                                         multiplier: 1.0,
                                         constant: 100))
        addConstraint(NSLayoutConstraint(item: reigisterButton,
                                         attribute: .height,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .height,
                                         multiplier: 1.0,
                                         constant: 40))
        
        //提示文字
        addConstraint(NSLayoutConstraint(item: titleLabel,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: loginButton,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: 20))
        addConstraint(NSLayoutConstraint(item: titleLabel,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .width,
                                         multiplier: 1.0,
                                         constant: 260))
        
    }

}
