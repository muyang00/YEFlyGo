//
//  PodfileViewController.swift
//  YEFlyGo
//
//  Created by yongen on 17/4/11.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

let kPodfileCellID = "kPodfileCellID"

class PodfileViewController: UIViewController {

    let imgArr = ["address", "message", "evaluate", "member_card", "collect", "password_setting", "set"]
    let titleArr = ["我的收货地址", "我的消息", "我的评价", "会员卡", "我的收藏", "密码设置", "设置"]
    
    fileprivate lazy var tableView : UITableView = {
       let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.separatorColor = UIColor.orange
        tableView.rowHeight = 70
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PodfileViewCell", bundle: nil), forCellReuseIdentifier: kPodfileCellID)
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    var userName : UILabel!
    var userImg : UIImageView!
    var isLogin : Bool?
    
    fileprivate lazy var headView : UIView = {
       let view = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 185))
        view.backgroundColor = UIColor.colorFromHex(0x989898)
        let stateView = UIView(frame: CGRect(x: 0, y: -20, width: kScreenW, height: 20))
        stateView.backgroundColor = UIColor.colorFromHex(0x989898)
        view.addSubview(stateView)
        self.userImg = UIImageView(frame: CGRect(x: kScreenW/2 - 49, y: 185/2 - 40, width: 98 , height: 98))
        self.userImg.kf.setImage(with: URL(string: "https://source.unsplash.com/random/320x320"))
        self.userImg.layer.masksToBounds = true
        self.userImg.layer.cornerRadius = 49
        view.addSubview(self.userImg)
        self.userName = UILabel(frame: CGRect(x: 20, y: 185/2 + 49 + 5, width: kScreenW - 40, height: 28))
        self.userName.textColor = UIColor.colorFromHex(0x383838)
        self.userName.text = "登录"
        self.userName.textAlignment = .center
        self.userName.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(self.userName)
        let tap = UITapGestureRecognizer(target: self, action: #selector(pushLogin))
        view.addGestureRecognizer(tap)
        
        return view
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
        self.navigationController?.navigationBar.isHidden = true
        self.tableView.tableHeaderView = headView
        
        view.addSubview(tableView)
    }
    func pushLogin(){
       print("pushLogin")
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
        
        cell.podfileLabel.text = titleArr[indexPath.row]
        cell.podfileIcon.image = UIImage(named: imgArr[indexPath.row])
        
        return cell
    }
    
}


