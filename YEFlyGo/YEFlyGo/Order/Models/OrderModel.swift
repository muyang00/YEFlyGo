//
//  OrderModel.swift
//  YEFlyGo
//
//  Created by yongen on 17/4/10.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit
import HandyJSON

struct OrderListModel: HandyJSON {
    var orderList: [OrderModel]?
}

struct OrderModel: HandyJSON {
    var productId: Int?
    var orderId: Int?
    var orderName:String?
    var orderCode:String?
    var createTime: Int64?
    var expressPrice: Int?
    var productPrice: Int?
    var productNum: Int?
    var productTotal: Int?
    var picPath:String?
    var status: Int?
    
    mutating func mapping(mapper: HelpingMapper) {
        mapper.specify(property: &picPath) { (string) -> (String) in
            //            return "http://120.24.3.172:8080/feigou-api" + string
            return "https://source.unsplash.com/random/480x\(300 + arc4random() % 10)"
        }
    }
}
