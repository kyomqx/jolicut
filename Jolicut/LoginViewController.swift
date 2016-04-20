//
//  seConnecter.swift
//  Jolicut
//
//  Created by Alexandre MISAIPHON on 18/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Code à charger pendant le chargement de la vue.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        let userEMail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
    
        let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail");
        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword");
        
        if(userEmailStored == userEMail)
        {
            if(userPasswordStored == userPassword)
            {
                // Login is successfull
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggin");
                NSUserDefaults.standardUserDefaults().synchronize();
                self.dismissViewControllerAnimated(true, completion: nil);
            }
            
        }
    }
    
}