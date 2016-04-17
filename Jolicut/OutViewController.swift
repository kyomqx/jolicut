//
//  OutViewController.swift
//  Jolicut
//
//  Created by Max KHAMVONGSA on 14/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit

class OutViewController: UIViewController {

    
    @IBOutlet weak var MenuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            MenuButton.target = self.revealViewController()
            MenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}
