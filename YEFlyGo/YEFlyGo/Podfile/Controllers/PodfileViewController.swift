//
//  PodfileViewController.swift
//  YEFlyGo
//
//  Created by yongen on 17/4/11.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

private let kPodfileCellID = "kPodfileCellID"

class PodfileViewController: UIViewController {

    var imgArr = ["address", "message", "evaluate", "member_card", "collect", "password_setting", "set"]
    var titleArr = ["我的收货地址", "我的消息", "我的评价", "会员卡", "我的收藏", "密码设置", "设置"]
    
    fileprivate lazy var tableView : UITableView = {
       let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.separatorColor = UIColor.orange
        tableView.rowHeight = 70
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PodfileViewCell.self, forCellReuseIdentifier: kPodfileCellID)
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
    }
}


//MARK: - 设置UI界面内容
extension PodfileViewController {
    func setupUI() {


        
        view.addSubview(tableView)
    }
}
//MARK: - 数据请求
extension PodfileViewController {
    func loadData() {
        
    }
}


extension PodfileViewController : UITableViewDelegate {
    
}

extension PodfileViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kPodfileCellID, for: indexPath) as! PodfileViewCell
        
        //  cell.iconimageView.image = UIImage.init(named: imgArr[indexPath.row])
        
        
        cell.podfileLabel.text = "wode"
        
        
        return cell
    }
    
}


