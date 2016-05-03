//
//  NotesForClassTableViewController.swift
//  NoteMap
//
//  Created by Victor Stone on 4/30/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import Foundation
import UIKit

class NotesForClassTableViewController : UITableViewController {
    
    var Notes : [NoteItem]!
    var Class : String!
    var ClassVC : ClassTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ClassVC = self.navigationController!.viewControllers[0] as! ClassTableViewController
        Notes = ClassVC.allData.noteForClasses[Class]
    }

    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Notes == nil {
            return 0
        }
        return Notes.count    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NoteCell") as! NoteCell
        cell.NoteDescription.text = Notes[indexPath.row].description
        cell.noteItem = Notes[indexPath.row]
        return cell
    }
    
    @IBAction func unwindCancelNotesTableViewController(segue: UIStoryboardSegue) {
        let source = segue.sourceViewController as! addNotesViewController
        if source.noteItem != nil {
            let id = source.noteItem.identifier
            let replacementIndex = ClassVC.allData.getIndexForNoteForClassAndNoteName(Class, notename: id)
            let newNote = NoteItem(id: id, descrip: source.Description.text!, classN: self.Class, pdflinks: source.pdfNotes, youtubelinks: source.youtubeNotes)
            Notes[replacementIndex!] = newNote
            ClassVC.allData.noteForClasses[Class]![replacementIndex!] = newNote
            self.tableView.reloadData()
        }
        
        
        
    }

    @IBAction func unwindAddNotesTableViewController(segue: UIStoryboardSegue) {
        let addNoteVC = segue.sourceViewController as! addNotesViewController
        let newNoteDescription = addNoteVC.Description.text!
        let ytLinks = addNoteVC.youtubeNotes
        let pdfLinks = addNoteVC.pdfNotes
        if addNoteVC.noteItem == nil {
            print("hello")
            let newNoteClass = Class
            let newNoteItem = NoteItem(id : newNoteDescription, descrip: newNoteDescription, classN: newNoteClass, pdflinks: pdfLinks, youtubelinks: ytLinks)
            Notes.append(newNoteItem)
            ClassVC.allData.noteForClasses[Class]!.append(newNoteItem)
            addNoteVC.identifier = newNoteDescription
            self.tableView.reloadData()
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToNote" {
            let senderCell = sender as! NoteCell
            let destinationNav = segue.destinationViewController as! UINavigationController
            let destination = destinationNav.viewControllers[0] as! addNotesViewController
            destination.noteItem = senderCell.noteItem
            destination.Class = Class
        } else if segue.identifier == "addNote" {
            let destination = (segue.destinationViewController as! UINavigationController).viewControllers[0] as! addNotesViewController
            destination.Class = Class
        }
    }


}