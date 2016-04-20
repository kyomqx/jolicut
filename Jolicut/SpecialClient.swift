//
//  SpecialClient.swift
//  Jolicut
//
//  Created by Kvin Taing on 19/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit

class SpecialClient: UITableViewCell {
    
    @IBOutlet var nom: UILabel!
    
    @IBOutlet var prenom: UILabel!
    
    @IBOutlet var sexe: UILabel!
    
    @IBOutlet var note: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
