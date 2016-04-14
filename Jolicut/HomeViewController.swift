//
//  ViewController.swift
//  Jolicut
//
//  Created by Max KHAMVONGSA on 13/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
    
    let imageArray : NSMutableArray = ["1.jpg", "2.jpg"]
    
    @IBOutlet weak var DisplayView: iCarousel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DisplayView.type = iCarouselType.Linear
        DisplayView.scrollToItemAtIndex(1, duration: 60)
    }
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        return imageArray.count
    }

    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        var imageView : UIImageView!
        
        if view == nil {
            imageView = UIImageView(frame: CGRectMake(0, 0, 375, 585))
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

