//
//  Deconnexion.swift
//  Jolicut
//
//  Created by Alexandre MISAIPHON on 20/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit
import Foundation

class Deconnexion: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Code à charger pendant le chargement de la vue.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loggoutButtonTapped(sender: UIButton) {
        NSUserDefaults.standardUserDefaults()
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        self.performSegueWithIdentifier("linkHtoC", sender: self)
    }
}
