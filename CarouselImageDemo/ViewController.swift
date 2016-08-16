//
//  ViewController.swift
//  CarouselImageDemo
//
//  Created by Yz on 16/8/16.
//  Copyright © 2016年 Yuz. All rights reserved.
//

import UIKit
private let ScreenWidth: CGFloat = UIScreen.mainScreen().bounds.width
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let frame = CGRectMake(0, 100, ScreenWidth, ScreenWidth)
        
        
        let carouselImageView = YzCarouselImage.carouselView(frame, superView: self.view)
        
        let  images: NSMutableArray = NSMutableArray.init(capacity: 5)
        
        
        for index in 1...5 {
            let imageName: NSString = String(index)
            let image: UIImage = UIImage.init(named: imageName as String)!
            images.addObject(image)
        }
        carouselImageView.imagesArray = images
        carouselImageView.duration = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

