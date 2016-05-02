//
//  SubjectTableViewController.swift
//  NoteMap
//
//  Created by Victor Stone on 4/30/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import Foundation
import UIKit

class SubjectTableViewController : UITableViewController {
    
    var ClassViewController : ClassTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let UInav = (self.tabBarController?.viewControllers![0] as! UINavigationController)
        ClassViewController = UInav.viewControllers[0] as! ClassTableViewController
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SubjectToClasses" {
            let senderCell = sender as! SubjectCell
            segue.destinationViewController.navigationItem.title = "Classes of Subject " + senderCell.SubjectsLabel.text!
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ClassViewController.allData.Classes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SubjectCell", forIndexPath: indexPath) as! SubjectCell
        let subjectList = [String](ClassViewController.allData.subjects.keys)
        cell.SubjectsLabel.text = subjectList[indexPath.row]
        cell.NumberOfClasses.text = "Number Of Classes: " + String(ClassViewController.allData.Classes.count)
        cell.NumberOfNotes.text = "Number of Notes : " + String(ClassViewController.allData.noteForClasses.count)
        return cell
    }
   
}