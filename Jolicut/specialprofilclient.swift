//
//  specialprofilclient.swift
//  Jolicut
//
//  Created by Souleymane TAMBADOU on 20/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit

class SpecialProfilClient: UITableViewCell {
    
    @IBOutlet var nom: UILabel!
    @IBOutlet var prenom: UILabel!
    @IBOutlet var sexe: UILabel!
    @IBOutlet var age: UILabel!
    @IBOutlet var ddn: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var adresse: UILabel!
    @IBOutlet var cp: UILabel!
    @IBOutlet var ville: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
