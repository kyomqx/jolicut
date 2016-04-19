//
//  DatePicker.swift
//  Jolicut
//
//  Created by Kvin Taing on 18/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit

class DatePicker: UIViewController, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.Date
        textField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(DatePicker.datePickerChanged(_:)), forControlEvents: .ValueChanged)
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
    
}