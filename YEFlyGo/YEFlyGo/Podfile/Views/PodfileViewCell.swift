//
//  PodfileViewCell.swift
//  YEFlyGo
//
//  Created by yongen on 17/4/11.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class PodfileViewCell: UITableViewCell {

  
    @IBOutlet weak var podfileIcon: UIImageView!
    @IBOutlet weak var podfileLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
