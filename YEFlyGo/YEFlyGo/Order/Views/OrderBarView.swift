//
//  OrderBarView.swift
//  YEFlyGo
//
//  Created by yongen on 17/4/10.
//  Copyright © 2017年 yongen. All rights reserved.
//

protocol OrderBarViewDelegate {
    func didSelectItem(atIndex: Int)
}

import UIKit

let kBarViewCellID = "BarViewCell"

class OrderBarView: UIView {

    var delegate : OrderBarViewDelegate?
    var titleArr = ["全部", "待支付", "进行中", "待评价", "退款单"]
    fileprivate lazy var barView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: CGFloat(kScreenW / 5), height: 30)
        let barView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        barView.delegate = self
        barView.dataSource = self
        barView.backgroundColor = UIColor.white
        barView.register(BarViewCell.self, forCellWithReuseIdentifier: kBarViewCellID)
        return barView
    }()
    fileprivate lazy var lineView : UIView = {
    let lineView = UIView(frame: CGRect(x: 0, y: self.frame.height - 3, width: kScreenW / 5, height: 3))
        lineView.backgroundColor = UIColor.orange
        return lineView
    }()
    fileprivate lazy var lineBackview : UIView = {
       let lineBackView = UIView(frame: CGRect(x: 0, y: self.frame.height - 3, width: kScreenW, height: 3))
        
         lineBackView.backgroundColor = UIColor.colorFromHex(0xededed)
        return lineBackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
  
        addSubview(barView)
        addSubview(lineBackview)
        addSubview(lineView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func creatOrderView() -> OrderBarView{
        let View = OrderBarView()
        return View
    }
    
}

extension OrderBarView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       delegate?.didSelectItem(atIndex: indexPath.item)
    }
}

extension OrderBarView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kBarViewCellID, for: indexPath) as! BarViewCell
        
         cell.lab.text = titleArr[indexPath.row]
        return cell
    }
}
