//
//  ViewController.swift
//  Jolicut
//
//  Created by Max KHAMVONGSA on 13/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
    
    let imageArray : NSMutableArray = ["1.jpg", "2.jpg", "3.jpg"]
    
    @IBOutlet weak var DisplayView: iCarousel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        DisplayView.type = iCarouselType.Linear
        _ = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(HomeViewController.EnabledAutoscroll1), userInfo: nil, repeats: true)
        _ = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: #selector(HomeViewController.EnabledAutoscroll2), userInfo: nil, repeats: true)
        _ = NSTimer.scheduledTimerWithTimeInterval(15, target: self, selector: #selector(HomeViewController.EnabledAutoscroll3), userInfo: nil, repeats: true)
    }
    
    func EnabledAutoscroll1() {
        DisplayView.scrollToItemAtIndex(1, duration: 1)
    }
    
    func EnabledAutoscroll2() {
        DisplayView.scrollToItemAtIndex(2, duration: 1)
    }
    
    func EnabledAutoscroll3() {
        DisplayView.scrollToItemAtIndex(0, duration: 1)
    }
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        return imageArray.count
    }

    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        var imageView : UIImageView!
        
        if view == nil {
            imageView = UIImageView(frame: CGRectMake(0, 0, 375, 586))
            imageView.contentMode = .ScaleToFill
        } else {
            imageView = view as! UIImageView
        }
        imageView.image = UIImage(named: "\(imageArray.objectAtIndex(index))")
        return imageView
    }

    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = true
        super.viewWillAppear(animated)
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        if (navigationController?.topViewController != self) {
            navigationController?.navigationBarHidden = false
        }
        super.viewWillDisappear(animated)
    }
 

}

