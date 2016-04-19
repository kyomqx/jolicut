//
//  Deconnecter.swift
//  Jolicut
//
//  Created by Alexandre MISAIPHON on 18/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit

class deco : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Code à charger pendant le chargement de la vue.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(animated: Bool) {
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn");
        if (!isUserLoggedIn)
        {
            self.performSegueWithIdentifier("loginView", sender: self);
        }
    }
    
    @IBAction func loggoutButtonTapped(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn");
        NSUserDefaults.standardUserDefaults().synchronize();
        
        self.performSegueWithIdentifier("loginView", sender: self);
    }
}