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
    fileprivate var titles : [String]
  
    fileprivate lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: kScreenW / 5, height: 30)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BarViewCell.self, forCellWithReuseIdentifier: kBarViewCellID)
        return collectionView
    }()
   lazy var lineView : UIView = {
    let lineView = UIView(frame: CGRect(x: 0, y: self.frame.height - 3, width: kScreenW / 5, height: 3))
        lineView.backgroundColor = UIColor.orange
        return lineView
    }()
    fileprivate lazy var lineBackview : UIView = {
       let lineBackView = UIView(frame: CGRect(x: 0, y: self.frame.height - 3, width: kScreenW, height: 3))
        
         lineBackView.backgroundColor = UIColor.colorFromHex(0xededed)
        return lineBackView
    }()
    
    
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
  
        setupUI()

    }
    func selectItem (atIndex: Int) {
        for index in 0..<titles.count {
            let cell = collectionView.cellForItem(at: IndexPath.init(row: index, section: 0)) as! BarViewCell
            cell.lab.textColor = UIColor.colorFromHex(0x383838)
            if index == atIndex {
                cell.lab.textColor = UIColor.colorFromHex(0xfd9816)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 设置collectionView的layout
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: kScreenW / 5, height: 30)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension OrderBarView {
    func setupUI(){
        
        addSubview(collectionView)
        addSubview(lineBackview)
        addSubview(lineView)
        
    }

}

extension OrderBarView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       delegate?.didSelectItem(atIndex: indexPath.item)
    }
}

extension OrderBarView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.titles.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kBarViewCellID, for: indexPath) as! BarViewCell
        
         cell.lab.text = titles[indexPath.row]
        return cell
    }
}
