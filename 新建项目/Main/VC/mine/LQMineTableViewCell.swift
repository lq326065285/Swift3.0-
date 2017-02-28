//
//  LQMineTableViewCell.swift
//  新建项目
//
//  Created by 李强 on 2017/2/20.
//  Copyright © 2017年 李强. All rights reserved.
//

import UIKit

class LQMineTableViewCell: UITableViewCell {

    let imgHead:UIImageView = UIImageView()
    
    let titleLabel:UILabel = UILabel.lq_label(withFrame: CGRect(x: 0, y: 0, width: 0, height: 0), title: "测试title", font: 15, textColor: UIColor.black, textAlignment: .left)
    
    let subtitleLabel:UILabel = UILabel.lq_label(withFrame: CGRect(x: 0, y: 0, width: 0, height: 0), title: "测试内容内容内容容内容内容容内容内容容内容内容容内容内容内容内容容内容内容内容内容容内容内容内容内容容内容内容内容内容容内容内容内容内容容内容内容", font: 15, textColor: UIColor.black, textAlignment: .left)

    let backView = UIView()
    
    var isInit = false
    func setupUI() {
        imgHead.backgroundColor = UIColor.gray
        addSubview(backView)
        self.backView.addSubview(imgHead)
        self.backView.addSubview(titleLabel)
        self.backView.addSubview(subtitleLabel)
        isInit = true
    }
    
    func setModel(model:AnyObject?) {
        if isInit == false {
            setupUI()
        }
       
        imgHead.snp.updateConstraints {[weak self] (ConstraintMaker) in
            guard let strongSelf = self else {
                return
            }
            ConstraintMaker.left.equalTo(10)
            ConstraintMaker.width.height.equalTo(100)
            ConstraintMaker.centerY.equalTo(strongSelf.backView.snp.centerY)
            ConstraintMaker.bottom.lessThanOrEqualTo(strongSelf.backView.snp.bottom).offset(-10).priority(751)
        }
        
        titleLabel.preferredMaxLayoutWidth = UIScreen.width - 10 - 10 - 100 - 10
        titleLabel.snp.updateConstraints {[weak self] (ConstraintMaker) in
            guard let strongSelf = self else {
                return
            }
            ConstraintMaker.top.equalTo(10)
            ConstraintMaker.left.equalTo(strongSelf.imgHead.snp.right).offset(10)
            ConstraintMaker.right.equalTo(strongSelf.backView.snp.right).offset(-10)
        }
        
        subtitleLabel.preferredMaxLayoutWidth = UIScreen.width - 10 - 10 - 100 - 10
        subtitleLabel.snp.updateConstraints {[weak self] (ConstraintMaker) in
            guard let strongSelf = self else {
                return
            }
            ConstraintMaker.top.equalTo(strongSelf.titleLabel.snp.bottom).offset(10)
            ConstraintMaker.left.equalTo(strongSelf.imgHead.snp.right).offset(10)
            ConstraintMaker.right.equalTo(strongSelf.backView.snp.right).offset(-10)
            ConstraintMaker.bottom.equalTo(strongSelf.backView.snp.bottom).offset(-10)
        }
        
        backView.snp.updateConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.top.equalTo(0)
        }
        
        backView.layoutIfNeeded()
    }

    func getCellHeight(model:AnyObject?) -> CGFloat {
        setModel(model: model)
        return self.backView.height
    }
}
