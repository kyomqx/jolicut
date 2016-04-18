//
//  Deconnecter.swift
//  Jolicut
//
//  Created by Alexandre MISAIPHON on 18/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import Foundation
import UIKit

class deco : UITableViewController {
    
    
    /* NSUserDefaults est capable de stoquer:
     NSData, NSString, NSNumber, NSDate, NSArray, ou NSDictionary.
     https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/Foundation/Classes/NSUserDefaults_Class/index.html
     */
    let maVariableIneffacable:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Code à charger pendant le chargement de la vue.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func deco(sender: UIButton) {
        NSUserDefaults.standardUserDefaults()
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        self.performSegueWithIdentifier("linkHtoC", sender: self)
    }
}