//
//  viewController.swift
//  Jolicut
//
//  Created by Souleymane TAMBADOU on 21/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit

class theViewController: UIViewController{
    @IBOutlet var slider: UISlider!
    @IBOutlet weak var label: UILabel!

    @IBAction func sliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        
        label.text = "\(currentValue)"
    }

}