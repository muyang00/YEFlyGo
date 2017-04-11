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

    var views = [UIView]()
    
    fileprivate lazy var barView : OrderBarView = {[weak self] in
        
        let titleFrame = CGRect(x: 0, y: 64, width: kScreenW, height: 33)
        let titleArr = ["全部", "待支付", "进行中", "待评价", "退款单"]
        let barView = OrderBarView(frame: titleFrame, titles: titleArr)
         barView.delegate = self
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
        
        self.navigationItem.title = "订单"
       automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(barView)
        
        for i in 0...4 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "OrderDetailController") as! OrderDetailController
            vc.status = i
            self.addChildViewController(vc)
            vc.view.frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: kScreenH - 146)
            vc.didMove(toParentViewController: self)
            views.append(vc.view)
        }
        
        view.addSubview(containerView)
        
    }
}


extension OrderViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("")
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollIndex = Int(round(scrollView.contentOffset.x / self.view.bounds.width))
        self.barView.lineView.frame.origin.x = (scrollView.contentOffset.x / 5)
        self.barView.selectItem(atIndex: scrollIndex)
    }
}

extension OrderViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kOrderVCID, for: indexPath)
        cell.contentView.addSubview(views[indexPath.row])
       // cell.backgroundColor = UIColor.randomColor()
        return cell
    }
}

extension OrderViewController : OrderBarViewDelegate {
    func didSelectItem(atIndex: Int) {
        print("didSelectItem ----- \(atIndex)")
        
        containerView.scrollRectToVisible(CGRect(origin: CGPoint.init(x: (self.view.bounds.width * CGFloat(atIndex)), y: 0), size: self.view.bounds.size), animated: true)
    }
}
