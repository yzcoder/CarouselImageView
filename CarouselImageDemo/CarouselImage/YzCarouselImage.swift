//
//  YzCarouselImage.swift
//  CarouselImageDemo
//
//  Created by Yz on 16/8/16.
//  Copyright © 2016年 Yuz. All rights reserved.
//


import UIKit
private let ScreenWidth: CGFloat = UIScreen.mainScreen().bounds.width

class YzCarouselImage: UIView ,UIScrollViewDelegate{
    
    
    var imagesArray : NSArray! {
        didSet {
            self.loadPage()
        }
    }
    
    var duration: NSInteger = 0 {
        didSet {
            if duration > 0 {
                self.creatTimer()
            }
        }
    }
    
    private lazy var mainScrollView : UIScrollView = {
        let scrollView = UIScrollView.init(frame: self.bounds)
        scrollView.contentSize = CGSizeMake(ScreenWidth * 3, self.bounds.height)
        scrollView.delegate = self
        return scrollView
    }()
    private lazy var currentImageView : UIImageView = {
        let imageView: UIImageView = UIImageView.init(frame: CGRectMake(ScreenWidth, 0, ScreenWidth, self.frame.height))
        return imageView
    }()
    private lazy var preImageView : UIImageView = {
        let imageView: UIImageView = UIImageView.init(frame: CGRectMake(0, 0, ScreenWidth, self.frame.height))
        return imageView
    }()
    private lazy var nextImageView : UIImageView = {
        let imageView: UIImageView = UIImageView.init(frame: CGRectMake(ScreenWidth * 2, 0, ScreenWidth, self.frame.height))
        return imageView
    }()
    
    private var currentIndex : NSInteger = 0
    private var timer: NSTimer?
    //class func to creat carouselview
    class func carouselView(frame: CGRect, superView: UIView ) -> YzCarouselImage {
        let carouselview = YzCarouselImage.init(frame: frame)
        superView.addSubview(carouselview)
        return carouselview
        
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setUI() {
        self.addSubview(mainScrollView)
        mainScrollView.pagingEnabled = true
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.showsHorizontalScrollIndicator = false
        mainScrollView.addSubview(currentImageView)
        mainScrollView.addSubview(preImageView)
        mainScrollView.addSubview(nextImageView)
    }
    //init carousel view
    private func loadPage() {
        
        mainScrollView.contentOffset = CGPointMake(ScreenWidth, 0)
        
        if imagesArray.count == 0 {
            return
        }
        // 加载三张图
        // 当前页
        currentImageView.image = imagesArray[currentIndex] as? UIImage
        
        // 左侧页
        let preIndex: NSInteger = currentIndex - 1 < 0 ?
            imagesArray.count - 1 :
            currentIndex - 1;
        preImageView.image = imagesArray[preIndex] as? UIImage
        // 右侧叶
        let nextIndex: NSInteger = currentIndex + 1 == imagesArray.count ?
            0 : self.currentIndex + 1;
        nextImageView.image = imagesArray[nextIndex] as? UIImage
        
    }
    //update view
    private func updateCurrentIndex() {
        let index = mainScrollView.contentOffset.x / ScreenWidth;
        if(index == 0) {
            currentIndex = currentIndex-1 < 0 ? imagesArray.count - 1 : currentIndex - 1;
            self.loadPage()
            return
        }
        
        if(index == 2) {
            currentIndex = currentIndex + 1 == imagesArray.count ?0 : currentIndex + 1;
            self.loadPage()
        }
    }
    
    private func creatTimer() {
        timer = NSTimer.init(timeInterval:NSNumber.init(integer: duration).doubleValue , target: self, selector:#selector(YzCarouselImage.timerUpdatePage) , userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
    }
    
    @objc private func timerUpdatePage() {
        self.mainScrollView.setContentOffset(CGPointMake(mainScrollView.contentOffset.x + ScreenWidth, mainScrollView.contentOffset.y), animated: true)
    }


    //UIScrollViewDelegate
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        self.updateCurrentIndex()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.updateCurrentIndex()
    }
    
}
