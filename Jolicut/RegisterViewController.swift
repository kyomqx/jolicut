//
//  DatePicker.swift
//  Jolicut
//
//  Created by Kvin Taing on 18/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    func textFieldDidBeginEditing(textField: UITextField) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.Date
        textField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(RegisterViewController.datePickerChanged(_:)), forControlEvents: .ValueChanged)
    }
    
    func datePickerChanged(sender : UIDatePicker) {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        dateText.text = formatter.stringFromDate(sender.date)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBOutlet weak var dateText: UITextField!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateText.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userId = userIdTextField.text;
        let userBirth = dateText.text;
        
        
        // Check for empty fields
        if (userEmail!.isEmpty || userPassword!.isEmpty || userId!.isEmpty || userBirth!.isEmpty)
        {
            
            // Display alert message
            displayMyAlertMessage("Tous les champs sont requis");
            return;
            
        }
        
        // Send user data to server side
        let myUrl = NSURL(string:"https://serveur-mqx.c9users.io/userRegister.php");
        let request = NSMutableURLRequest(URL:myUrl!);
        request.HTTPMethod = "POST";
        
        let postString = "Email=\(userEmail)&Identifiant=\(userId)&Mdp=\(userPassword)&Date_de_naissance=\(userBirth)";
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            print("response=\(error)")
            
            let responseString=NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString=\(responseString)")
            
            var err: NSError?
            let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
            
            if let parseJSON = json {
                let resultValue = parseJSON["status"] as? String
                print("result=\(resultValue)")
                
                var isUserRegistered:Bool = false;
                if(resultValue=="Success")  {   isUserRegistered = true;    }
                
                var messageToDisplay:String = parseJSON["message"] as! String!;
                if(!isUserRegistered)
                {
                    messageToDisplay = parseJSON["message"] as! String!;
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                
                    // Display alert message with confirmation
                    let myAlert = UIAlertController(title:"Erreur", message: messageToDisplay, preferredStyle: UIAlertControllerStyle.Alert);
                    
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){action in
                        self.dismissViewControllerAnimated(true, completion: nil);
                    }
                    
                    myAlert.addAction(okAction);
                    self.presentViewController(myAlert, animated: true, completion: nil);
                
                });
            }
//        task.resume()
        }
        
        task.resume()
    
    
    }

    func displayMyAlertMessage(userMessage:String)
    {
        var myAlert = UIAlertController(title: "Erreur", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil);
        
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil);
    }
}