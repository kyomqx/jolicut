//
//  teteronde.swift
//  Jolicut
//
//  Created by Souleymane TAMBADOU on 20/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit

class teteronde: UIViewController {

    @IBOutlet var photoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        circularImage(photoImageView)
    }
    
func circularImage(photoImageView: UIImageView?)
{
    photoImageView!.layer.frame = CGRectInset(photoImageView!.layer.frame, 0, 0)
    photoImageView!.layer.borderColor = UIColor.grayColor().CGColor
    photoImageView!.layer.cornerRadius = photoImageView!.frame.height/2
    photoImageView!.layer.masksToBounds = false
    photoImageView!.clipsToBounds = true
    photoImageView!.layer.borderWidth = 0.5
    photoImageView!.contentMode = UIViewContentMode.ScaleAspectFill
}


}