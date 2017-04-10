//
//  BarViewCell.swift
//  YEFlyGo
//
//  Created by yongen on 17/4/10.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class BarViewCell: UICollectionViewCell {
    let lab = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        lab.frame = CGRect.init(x: 0, y: 0, width: kScreenW/5, height: 30)
        lab.textAlignment = .center
        lab.textColor = UIColor.black
        lab.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(lab)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
