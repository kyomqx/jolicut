//
//  DatePicker.swift
//  Jolicut
//
//  Created by Kvin Taing on 18/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit

class DatePicker: UIViewController, UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBOutlet weak var dateText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateText.delegate = self
    }
    
}