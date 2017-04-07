//
//  HomeModel.swift
//  YEFlyGo
//
//  Created by yongen on 17/4/7.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit
import HandyJSON

struct ProductModel :  HandyJSON{
    var page : [String : AnyObject]?
    var productList : [productListModel]?
}

struct productListModel : HandyJSON {
    
    var bussinesID : Int?
    var categoryID : Int?
    var createTime : Int64?
    var discountPrice : Int?
    var expressPrice : Int?
    var name  : String?
    var picPath : String?
    var price : Int!
    var productDescribe : String?
    var productID : Int?
    var saleNum : Int64?
    var status : Int?
    var stockNum : Int?
    var updateTime : Int64?
    mutating func mapping(mapper: HelpingMapper) {
        mapper.specify(property: &picPath){ (string) -> (String) in
            return "https://source.unsplash.com/random/480x320"
            
        }
    }
}


