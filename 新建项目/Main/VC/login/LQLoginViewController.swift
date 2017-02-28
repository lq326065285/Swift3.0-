//
//  LQLoginViewController.swift
//  新建项目
//
//  Created by 李强 on 2017/2/21.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit

class LQLoginViewController: LQBaseViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "登录"
        setupContentView()
    }
    
    override func setupTableView() {
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    
    func setupContentView() {
        let labUserName:UILabel = UILabel.lq_label(withFrame: CGRect(), title: "账 号", font: 15, textColor: UIColor.black, textAlignment: .left)
        
        let labPassword:UILabel = UILabel.lq_label(withFrame: CGRect(), title: "密 码", font: 15, textColor: UIColor.black, textAlignment: .left)
        let textFUserName:UITextField = UITextField.lq_textField(withFrame: CGRect(), placeholder: "请输入用户名", borderStyle: .none, delegate: self, font: 15, keyboardType: .default)
        let textFPassword:UITextField = UITextField.lq_textField(withFrame: CGRect(), placeholder: "请输入密码", borderStyle: .none, delegate: self, font: 15, keyboardType: .default)
        let headImageView = UIImageView();
        headImageView.image = UIImage(named: "userMsg_head")
        headImageView.layer.cornerRadius = 75
        headImageView.layer.masksToBounds = true
        
        let button:UIButton = UIButton.lq_button(withFrame: CGRect(), buttonType: .custom, title: "确定", target: self, selector: #selector(clickButton), textColor: UIColor.white, font: 15)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        let mbackView = UIView()
        
        mbackView.addSubview(labPassword)
        mbackView.addSubview(labUserName)
        mbackView.addSubview(textFUserName)
        mbackView.addSubview(textFPassword)
        mbackView.addSubview(headImageView)
        mbackView.addSubview(button)
        view.addSubview(mbackView)
        
        
        
        //MARK: - layout
        //设置layout
        headImageView.snp.updateConstraints { (make) in
            make.top.equalTo(10)
            make.width.height.equalTo(150)
            make.centerX.equalTo(mbackView.snp.centerX)
        }
        
        
        labUserName.snp.updateConstraints { (make) in
            make.left.equalTo(10)
            make.height.equalTo(30)
            make.width.equalTo(labUserName.width)
            make.top.equalTo(headImageView.snp.bottom).offset(20)
        }
        
        labPassword.snp.updateConstraints { (make) in
            make.left.equalTo(10)
            make.height.equalTo(30)
            make.top.equalTo(labUserName.snp.bottom).offset(20)
        }
        
        textFUserName.snp.updateConstraints { (make) in
            make.left.equalTo(labUserName.snp.right).offset(10)
            make.height.equalTo(30)
            make.right.equalTo(-10)
            make.top.equalTo(labUserName.snp.top)
        }
        
        textFPassword.snp.updateConstraints { (make) in
            make.left.equalTo(labPassword.snp.right).offset(10)
            make.height.equalTo(30)
            make.right.equalTo(-10)
            make.top.equalTo(labPassword.snp.top)
        }
        
        button.snp.updateConstraints { (make) in
            make.left.equalTo(10)
            make.height.equalTo(44)
            make.right.equalTo(-10)
            make.top.equalTo(labPassword.snp.bottom).offset(20)
            make.bottom.equalTo(mbackView.snp.bottom)
        }
        
        mbackView.snp.updateConstraints {(make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(60)
        }
        
        mbackView.layoutIfNeeded()
        print("\(mbackView.frame)")
    }
    
    
    
    func clickButton() {
        print("登录")
        
    }
}
