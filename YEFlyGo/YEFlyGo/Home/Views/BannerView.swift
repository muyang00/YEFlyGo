//
//  BannerView.swift
//  YEFlyGo
//
//  Created by yongen on 17/4/7.
//  Copyright © 2017年 yongen. All rights reserved.
//

protocol BannerViewDelegate {
    func didSelectImage(atIndex: Int)
}

import UIKit
import Kingfisher

class BannerView: UIScrollView {


    var ImageDelegate : BannerViewDelegate?
    
    var imageUrlArr : [String]! {
        didSet{
            for i in 0..<imageUrlArr.count {
                let img = UIImageView(frame: CGRect.init(x: CGFloat(i) * frame.width, y: 0, width: frame.width, height: frame.height))
                let tap = UITapGestureRecognizer(target: self, action: #selector(selectsImage))
                img.addGestureRecognizer(tap)
                img.isUserInteractionEnabled = true
                let loadURL = URL(string: imageUrlArr[i])
                img.kf.setImage(with: loadURL)
                img.tag = 7777 + i
                self.addSubview(img)
            }
        }
    }
    class func creatBanner(frame : CGRect, imageUrlArr: [String], delegate: BannerViewDelegate) ->BannerView{
        let bannerView = BannerView(frame: frame)
        bannerView.imageUrlArr = imageUrlArr
        bannerView.ImageDelegate = delegate
        bannerView.isPagingEnabled = true
        bannerView.showsHorizontalScrollIndicator = false
        bannerView.contentSize = CGSize(width: kScreenW * CGFloat(imageUrlArr.count), height: frame.height)
        return bannerView
    }
 
    func selectsImage(tap: UITapGestureRecognizer){
        ImageDelegate?.didSelectImage(atIndex: (tap.view?.tag)! - 7777)
    }

}
