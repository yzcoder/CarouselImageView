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

    @IBOutlet weak var editLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let frame = self.view.bounds
        
        let carouselImageView = YzCarouselImage.carouselView(frame, superView: self.view)
        
        let  images: NSMutableArray = NSMutableArray.init(capacity: 5)
        
        
        for index in 1...6 {
            let imageName: NSString = String(index)
            let image: UIImage = UIImage.init(named: imageName as String)!
            images.addObject(image)
        }
        carouselImageView.imagesArray = images
        carouselImageView.duration = 3
        
        
        self.view.bringSubviewToFront(editLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

