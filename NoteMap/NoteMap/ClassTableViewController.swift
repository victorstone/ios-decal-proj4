//
//  ViewController.swift
//  NoteMap
//
//  Created by Victor Stone on 4/27/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import UIKit

class ClassTableViewController: UITableViewController {
    
    var allData : mainData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allData = mainData()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
        self.navigationItem.title = "Classes"
    }
    
    @IBAction func enableEditing(sender: AnyObject) {
        let editButton = sender as! UIBarButtonItem
        if (self.tableView.editing) {
            editButton.title = "Edit"
            self.tableView.setEditing(false, animated: true)
        } else {
            editButton.title = "Done"
            self.tableView.setEditing(true, animated: true)
        }

    }
    @IBAction func AddClassAction(sender: AnyObject) {
        
        //Create all AlertControllers
        let addNewClass = UIAlertController(title: "Add New Class", message:
            "Enter The Name of the Class You Wish To Add", preferredStyle: UIAlertControllerStyle.Alert)
        let invalidSubjectAlert = UIAlertController(title: "Invalid Input", message: "Please enter atleast one character for your subject name", preferredStyle: UIAlertControllerStyle.Alert)
        let invalidAlert = UIAlertController(title: "Invalid Input", message: "Please enter atleast one character for your class name", preferredStyle: UIAlertControllerStyle.Alert)
        let classExistsAlert = UIAlertController(title: "Class Already Exists", message: "The class you're trying to add already exists", preferredStyle: UIAlertControllerStyle.Alert)

        var className = ""

        //AlertController for Class Already Existing
        classExistsAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
        
        //AlertController for Adding New Class
        addNewClass.addTextFieldWithConfigurationHandler(nil)
        addNewClass.textFields![0].placeholder = "Enter Class Name"
        addNewClass.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default,handler: nil))
        
        //AlertController for Invalid Inputs (Empty line) in Class Input
        
        invalidAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler : {(action) -> Void in
            self.presentViewController(addNewClass, animated: true, completion: nil)}))
        
        
        //AlertController for giving the class a subject.
        let giveSubjectName = UIAlertController(title: "Enter Class Subject", message: "Enter the subject of the class to add", preferredStyle: UIAlertControllerStyle.Alert)
        giveSubjectName.addTextFieldWithConfigurationHandler(nil)
        giveSubjectName.textFields![0].placeholder = "Enter Subject Name"
        giveSubjectName.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        giveSubjectName.addAction(UIAlertAction(title: "Add", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            let text = giveSubjectName.textFields![0].text
            if text == "" {
                self.presentViewController(invalidSubjectAlert, animated: true, completion: nil)
            } else {
                self.allData.addClass(ClassItem(name: className, sub: text!))
                self.tableView.reloadData()
            }
        }))
        
        //AlertController for Invalid Inputs (Empty line) in Subject Input
        
        invalidSubjectAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler : {(action) -> Void in
            self.presentViewController(giveSubjectName, animated: true, completion: nil)}))

        //AlertController for Adding Class
        addNewClass.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default,handler: {(action) -> Void in
            let text = addNewClass.textFields![0].text
            if text == "" {
                self.presentViewController(invalidAlert, animated: true, completion: nil)
            } else {
                if !self.allData.classAlreadyExists(text!) {
                    className = text!
                    self.presentViewController(giveSubjectName, animated: true, completion: nil)
                } else {
                    self.presentViewController(classExistsAlert, animated: true, completion: nil)
                }
            }
        }))
        self.presentViewController(addNewClass, animated: true, completion: nil)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ClassesToNotes" {
            let classSender = sender as! ClassCell
            let className = classSender.ClassNameLabel.text
            let notesForClassVC = segue.destinationViewController as! NotesForClassTableViewController
            notesForClassVC.navigationItem.title = "Notes for " + className!
            notesForClassVC.Class = className
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData.Classes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ClassCell", forIndexPath: indexPath) as! ClassCell
        let classList = [String](allData.Classes.keys)
        let className = classList[indexPath.row]
        cell.ClassNameLabel.text = className
        let notesForClass = (allData.noteForClasses[className])
        cell.NumberOfNotesLabel.text = "Number of Notes: " + String(notesForClass!.count)
        cell.SubjectLabl.text = "Subject: " + allData.Classes[className]!.subject
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        cell.TimeStamp.text = "Last Edited: " + dateFormatter.stringFromDate(allData.Classes[className]!.lastEdited)
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let classList = [String](allData.Classes.keys)
            let className = allData.Classes[classList[indexPath.row]]
            allData.removeClass(className!)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

