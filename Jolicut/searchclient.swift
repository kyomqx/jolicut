//
//  searchclient.swift
//  Jolicut
//
//  Created by Kvin Taing on 19/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class searchclient: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        let url = NSURL(string: "https://serveur-mqx.c9users.io/selectP.php")
        let data = NSData(contentsOfURL: url!)
        values = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SpecialCell
        let maindata = values[indexPath.row]
        cell.nom.text = maindata["Nom"] as? String
        cell.prenom.text = maindata["Prenom"] as? String
        cell.note.text = maindata["Note"] as? String
        cell.disponible.text = maindata["Disponible"] as? String
        cell.statut.text = maindata["Statut"] as? String
        cell.sexe.text = maindata["Sexe"] as? String
        return cell;
        
    }
    
}
