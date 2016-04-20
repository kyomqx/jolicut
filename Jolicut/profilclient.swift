//
//  profilclient.swift
//  Jolicut
//
//  Created by Souleymane TAMBADOU on 20/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class profilclient: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    @IBAction func refresh(sender: AnyObject) {
        get();
    }
    
    var values:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        get();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func get(){
        let url = NSURL(string: "https://serveur-mqx.c9users.io/selectCl.php")
        let data = NSData(contentsOfURL: url!)
        values = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
        tableView.reloadData()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SpecialProfilClient
        let maindata = values[indexPath.row]
        cell.nom.text = maindata["Nom"] as? String
        cell.prenom.text = maindata["Prenom"] as? String
        cell.sexe.text = maindata["Sexe"] as? String
        cell.age.text = maindata["Age"] as? String
        cell.ddn.text = maindata["Date_de_naissance"] as? String
        cell.email.text = maindata["Email"] as? String
        cell.adresse.text = maindata["Adresse"] as? String
        cell.cp.text = maindata["Code_postal"] as? String
        cell.ville.text = maindata["Ville"] as? String
        return cell;
    }
    
  
}