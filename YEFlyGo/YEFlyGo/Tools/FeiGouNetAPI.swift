//
//  FeiGouNetAPI.swift
//  YEFlyGo
//
//  Created by yongen on 17/4/10.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

class FeiGouNetAPI: NSObject {

    static let shareInstance = FeiGouNetAPI()
    let baseApi = "http://120.24.3.172:8080/feigou-api/"
    
    func getHomeList(pageNum: Int, pageSize : Int, completion: @escaping (ProductModel) -> Void) {
        request(urlString: "index/ad/productList", method: .get, parameters: ["pageNum":"\(pageNum)", "pageSize":"\(pageSize)"]){ (jsonStr) in
            if let model = JSONDeserializer<ProductModel>.deserializeFrom(json: jsonStr) {
                completion(model)
            }
        }
    }
    func getHomeBanner(completion : @escaping () -> Void){
        
    }
    func getHomeCategory(completion: @escaping(categoryModel) -> Void){
        request(urlString: "index/category", method: .get, parameters: nil) { (jsonStr) in
            if let model = JSONDeserializer<categoryModel>.deserializeFrom(json: jsonStr){
            completion(model)
            }
        }
    }
    
//    func loginApp(userName: String, passWord: String, completion: @escaping (UserModel) -> Void) {
//        request(urlString: "user/login", method: .post, parameters: ["mobilePhone":userName, "password":passWord]) { (jsonStr) in
//            if let model = JSONDeserializer<UserModel>.deserializeFrom(json: jsonStr) {
//                completion(model)
//            }
//        }
//    }
//    
    func getOrderList(status:Int, completion: @escaping (OrderListModel) -> Void) {
        request(urlString: "order/findlist", method: .get, parameters: ["userId": "", "Status": status, "pageNum": 0, "pageSize": 10]) { (jsonStr) in
            if let model = JSONDeserializer<OrderListModel>.deserializeFrom(json: jsonStr) {
                completion(model)
            }
        }
    }

    
    func request(urlString: String, method : HTTPMethod, parameters: [String : Any]?, completion: @escaping(String?) -> Void){
        let url = URL(string: baseApi + urlString)!
        if method == .post {
            Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.prettyPrinted).responseJSON{ (json) in
                let jsonStr = String(data: json.data!, encoding: .utf8)!
                completion(jsonStr)
            }
        }else{
            Alamofire.request(url, method:.get, parameters: parameters).responseJSON{(json) in
                let jsonStr = String(data: json.data!, encoding: .utf8)
                completion(jsonStr)
            }
        }
    }
}
