//
//  TableViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Charles on 28/11/2015.
//  Copyright © 2015 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class TableViewController: UITableViewController
{
    
    
    var DataFromParse = [String]() // this array will have all data from Parse
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        query() // <---- This is how you called the function query
        
        for x in DataFromParse
        {
            print(" \(x) \n")
        }
        
    }
    
    
    
    func query()
        
        
    {
        
        
        
        
        /*
        This function will get data from Parse and save all firstnames into DataFromParse array
        */
        
        let query = PFQuery(className:"_User")
        query.findObjectsInBackgroundWithBlock { (results: [PFObject]?, error: NSError?) -> Void in
            
            
            
            if error != nil
            {
                if let objects = results
                {
                    for object in objects
                    {
                        let firstName = object["firstname"] as! String
                        self.DataFromParse.append(firstName)
                        
                        
                        self.tableView.reloadData() //<-- must reloadData()
                    }
                }
            }
        }
        
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = DataFromParse[indexPath.row]
        
        return cell
        
        
    }
    
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return DataFromParse.count
    }
    
    
    
}
