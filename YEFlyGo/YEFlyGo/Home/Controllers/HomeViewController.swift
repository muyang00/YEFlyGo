//
//  HomeViewController.swift
//  YEFlyGo
//
//  Created by yongen on 17/4/7.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

private let kHomeCellID = "kHomeCellID"
private let kHomeCategoryCellID = "kHomeCategoryCellID"

class HomeViewController: UIViewController {

    var listData : ProductModel?
    var categoryArr : [categoryListModel]?
    let listName = ["苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果", "香蕉香蕉香蕉香蕉香蕉香蕉香蕉", "栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子", "哈密瓜哈密瓜哈密瓜哈密瓜", "苹果苹果苹果苹果苹蕉香蕉", "香蕉香蕉香蕉香蕉香蕉香蕉香蕉", "栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子", "栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子", "栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子栗子", "果苹果苹果苹果苹蕉香蕉子栗子栗子栗子栗子栗子栗子栗子"]
    let listPrice = [12,321,3123,21,31,3,32,3,11,65]
    
    fileprivate lazy var tableView : UITableView = {
       let tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.orange
        tableView.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenW / 5 * 2)
        tableView.register(UINib(nibName: "HomeListCell", bundle: nil), forCellReuseIdentifier: kHomeCellID)
        return tableView
    }()
    
    fileprivate lazy var headView : UIView = {
        let bannerArr = ["http://120.24.3.172:8080/feigou-api/api/upload/images/index/banner/home_banner1.png",
                         "http://120.24.3.172:8080/feigou-api/api/upload/images/index/banner/home_banner2.png",
                         "http://120.24.3.172:8080/feigou-api/api/upload/images/index/banner/home_banner3.png"]
        let headView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenW / 2 + (kScreenW / 5 * 2) + 30))
        let bannerView = BannerView.creatBanner(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenW / 2), imageUrlArr: bannerArr, delegate: self as BannerViewDelegate)
        headView.addSubview(bannerView)
        headView.addSubview(self.collectionView)
        return headView
    }()
    
    fileprivate lazy var collectionView : UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       layout.minimumLineSpacing = 0
       layout.minimumInteritemSpacing = 0
       layout.itemSize = CGSize(width: kScreenW / 5, height: kScreenW / 5 + 15)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: kScreenW / 2, width: kScreenW, height: kScreenW / 5 * 2 + 30), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: kHomeCategoryCellID)
        return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
    }
}

//设置UI内容界面
extension HomeViewController {
    func setupUI() {
      
      self.navigationItem.titleView = UIImageView(image: UIImage(named: "homelogo"))
        

      tableView.tableHeaderView = headView
        
      view.addSubview(tableView)
        
    }
}

//加载请求数据
extension HomeViewController {
    func loadData() {
        FeiGouNetAPI.shareInstance.getHomeList(pageNum: 0, pageSize: 3) { (respondModel) in
            self.listData = respondModel
            self.tableView.reloadData()
        }
        FeiGouNetAPI.shareInstance.getHomeCategory{ (respondModel) in
            self.categoryArr = respondModel.categoryList
            self.collectionView.reloadData()
        }
        
    
    }
}

//MARK: - 遵守UITableViewDelegate代理方法
extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath", indexPath)
    }
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kHomeCellID, for: indexPath) as! HomeListCell
    
        cell.iconImageView.kf.setImage(with: URL(string:"https://source.unsplash.com/random/300x(\(200+indexPath.row))"))
        return cell
    }
}
//MARK: - 遵守UICollectionViewDelegate代理方法
extension HomeViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("indexPath", indexPath)
    }
}

extension HomeViewController : UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kHomeCategoryCellID, for: indexPath) as! CategoryCell
        if self.categoryArr != nil {
            let model : categoryListModel = self.categoryArr![indexPath.item]
            cell.titleLabel.text = model.name

            cell.iconImageView.kf.setImage(with: URL(string:(model.icon)!))
        }
        return cell
    }
    
}

//MARK: - 遵守BannerViewDelegate代理方法
extension HomeViewController : BannerViewDelegate {
    func didSelectImage(atIndex: Int) {
        
        print("点击的是第\(atIndex)张图片")
    }
}

