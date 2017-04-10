//
//  OrderViewController.swift
//  YEFlyGo
//
//  Created by yongen on 17/4/10.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

private let kOrderVCID = "kOrderVCID"

class OrderViewController: UIViewController {

    fileprivate lazy var barView : OrderBarView = {
        
        let barView = OrderBarView(frame: CGRect(x: 0, y: 64, width: kScreenW, height: 33))
     
        return barView
    }()
    fileprivate lazy var containerView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        layout.itemSize = CGSize(width: kScreenW, height: kScreenH - 146)
        layout.scrollDirection = .horizontal
        
        let containerView = UICollectionView(frame: CGRect(x: 0, y: 97, width: kScreenW, height: kScreenH - 146), collectionViewLayout: layout)
        containerView.delegate = self
        containerView.dataSource = self
        containerView.isPagingEnabled = true
        containerView.backgroundColor = UIColor.white
        containerView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kOrderVCID)
        return containerView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(barView)
        view.addSubview(containerView)
        
    }
}


extension OrderViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("")
    }
}

extension OrderViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kOrderVCID, for: indexPath)
        
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
}

extension OrderViewController : OrderBarViewDelegate {
    func didSelectItem(atIndex: Int) {
        print("didSelectItem ----- \(atIndex)")
    }
}
