//
//  seConnecter.swift
//  Jolicut
//
//  Created by Alexandre MISAIPHON on 18/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet var monchamp: UITextField!
    @IBOutlet var monchamp2: UITextField!
    
    /* NSUserDefaults est capable de stoquer:
     NSData, NSString, NSNumber, NSDate, NSArray, ou NSDictionary.
     https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/Foundation/Classes/NSUserDefaults_Class/index.html
     */
    let maVariableIneffacable:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Code à charger pendant le chargement de la vue.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        //code à charger après le chargement de la vue
        let estLoguer:Int = maVariableIneffacable.integerForKey("estCO") as Int
        if(estLoguer == 1){
            //si on est connecté à l'ouverture de l'appliction
            self.performSegueWithIdentifier("linkCtoH", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func seConnecter(sender: UIButton) {
            //On récupère les valeur que l'utilisateur a entré
        let username:NSString = monchamp.text!
        let password:NSString = monchamp2.text!
        
        if( username.isEqualToString("") || password.isEqualToString("") ){
            //si les champs sont vides
            let alert:UIAlertView = UIAlertView()
            alert.title = "Erreur"
            alert.message = "Entrez vos identifiants"
            alert.delegate = self
            alert.addButtonWithTitle("OK")
            alert.show()
        }else{
            
            let post:NSString = "Identifiant=\(username)&Mdp=\(password)"
            
            NSLog("PostData: %@",post);
            
            let url:NSURL = NSURL(string:"https://serveur-mqx.c9users.io/login.php")!
            
            let postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
            
            let postLength:NSString = String( postData.length )
            
            let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.HTTPBody = postData
            request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            
            var reponseError: NSError?
            var response: NSURLResponse?
            
            var urlData: NSData?
            do {
                urlData = try NSURLConnection.sendSynchronousRequest(request, returningResponse:&response)
            } catch _ as NSError {
                urlData = nil
            } catch {
                fatalError()
            }
            
            
            
            if ( urlData != nil ) {
                let res = response as! NSHTTPURLResponse!;
                
                NSLog("Response code: %ld", res.statusCode);
                
                if (res.statusCode >= 200 && res.statusCode < 300)
                {
                    let responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
                    
                    NSLog("Response ==> %@", responseData);
                    
                    var error: NSError?
                    
                    var jsonData:NSDictionary = NSDictionary()
                    do {
                        jsonData = try NSJSONSerialization.JSONObjectWithData(urlData!,options:NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    }catch {  // handle error
                    }
                    
                    
                    let success:NSInteger = jsonData.valueForKey("erreur") as! NSInteger
                    
                    
                    NSLog("Success: %ld", success);
                    
                    if(success == 1)
                    {
                        NSLog("Login OK");
                        
                        let idJSON:NSString = jsonData.valueForKey("Id") as! NSString
                        let nomJSON:NSString = jsonData.valueForKey("Nom") as! NSString
                        let identifiantJSON:NSString = jsonData.valueForKey("Identifiant") as! NSString
                        
                        maVariableIneffacable.setObject(idJSON, forKey: "Id")
                        maVariableIneffacable.setObject(nomJSON, forKey: "Nom")
                        maVariableIneffacable.setObject(identifiantJSON, forKey: "Identifiant")
                        maVariableIneffacable.setInteger(1, forKey: "estCO")
                        maVariableIneffacable.synchronize()
                        
                        self.performSegueWithIdentifier("linkCtoH", sender: self)
                        
                    }else{
                        NSLog("Login échoué");
                        
                        let alertView:UIAlertView = UIAlertView()
                        alertView.title = "Invalide"
                        alertView.message = "Vos identifiants ne correspondent pas"
                        alertView.delegate = self
                        alertView.addButtonWithTitle("OK")
                        alertView.show()
                        
                    }
                    
                } else {
                    let alertView:UIAlertView = UIAlertView()
                    alertView.title = "Erreur"
                    alertView.message = "Veuillez vous connecter à internet"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                }
            } else {
                let alertView:UIAlertView = UIAlertView()
                alertView.title = "Erreur"
                alertView.message = "Veuillez vous connecter à internet"
                if let error = reponseError {
                    alertView.message = (error.localizedDescription)
                }
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
                }
                
            }//fin du SI champs vides
    }
}