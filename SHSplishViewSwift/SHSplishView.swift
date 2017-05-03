//
//  SHSplishView.swift
//  SHSplishViewSwift
//
//  Created by lalala on 2017/5/3.
//  Copyright © 2017年 lsh. All rights reserved.
//

import UIKit

class SHSplishView: UIView, UIScrollViewDelegate{
    var imageArray:Array<Any> = []
    var scroView:UIScrollView?
    var _currentPage:Int?
    
    func initWith(array: Array<Any>) {
        imageArray = array;
        configUI()
    }
    func onClick() {
        self.isHidden = true
        self.removeFromSuperview()
        
        print("点击了按钮")
    }
    func configUI() {
        scroView = UIScrollView.init(frame: self.bounds)
        scroView?.backgroundColor = UIColor.yellow
        //创建滚动视图的子视图
        for i in 0..<imageArray.count {
            let imageView = UIImageView.init(frame:CGRect.init(x: CGFloat(i * Int(self.frame.size.width)), y: 0, width: self.frame.size.width, height: self.frame.size.height))
            imageView.image = UIImage.init(named: imageArray[i] as! String)
            imageView.backgroundColor = UIColor.red
            imageView.isUserInteractionEnabled = true
            let dd = i
            if dd == imageArray.count - 1{
                let button = UIButton.init(frame: CGRect.init(x: 50, y: self.frame.size.height-70, width: self.frame.size.width-2*50, height: 41))
                button.backgroundColor = UIColor.purple
                imageView.addSubview(button)
                button.addTarget(self, action: #selector(onClick), for: UIControlEvents.touchUpInside)
            }
            scroView?.addSubview(imageView)
        }
        scroView?.contentSize = CGSize.init(width: CGFloat(imageArray.count * Int(self.frame.size.width)), height: self.frame.size.height)
        scroView?.contentOffset = CGPoint.init(x: 0, y: 0)
        scroView?.bounces = false
        scroView?.delegate = self
        scroView?.isPagingEnabled = true
        scroView?.showsHorizontalScrollIndicator = false
        self.addSubview(scroView!)
        let pageControl = UIPageControl.init(frame: CGRect.init(x: 30, y: self.frame.size.height - 30, width: self.frame.size.width - 2 * 30, height: self.frame.size.height))
        pageControl.numberOfPages = imageArray.count
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
        _currentPage = 1
        pageControl.currentPage = _currentPage!
        pageControl.tag = 100
        self.addSubview(pageControl)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let point:CGPoint = scrollView.contentOffset
        let width = self.frame.size.width
        
        let ddd = self.frame.size.width * CGFloat(imageArray.count - 1)
        if point.x == ddd {
            scrollView.contentOffset = CGPoint.init(x: ddd, y: 0)
        }
        //获得页码指示器
        let page = self.viewWithTag(100) as! UIPageControl
        _currentPage = Int(scrollView.contentOffset.x/width)
        page.currentPage = _currentPage!
    }
}
