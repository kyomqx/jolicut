//
//  SpecialFacture.swift
//  Jolicut
//
//  Created by Kvin Taing on 19/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit

class SpecialFacture: UITableViewCell {
    
    @IBOutlet var nom: UILabel!
    
    @IBOutlet var prenom: UILabel!
    
    
    @IBOutlet var prix: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
