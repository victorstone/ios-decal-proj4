
//
//  File.swift
//  NoteMap
//
//  Created by Victor Stone on 4/30/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import Foundation
import UIKit

class addNotesViewController : UIViewController , UITableViewDataSource, UITableViewDelegate{

    var pdfNotes : [pdfItem]!
    var youtubeNotes : [youtubeItem]!
    var noteItem : NoteItem!
    var Class : String!
    
    @IBOutlet weak var PDFThumbs: UITableView!
    @IBOutlet weak var YoutubeThumbs: UITableView!

    @IBOutlet weak var CancelOrBack: UIBarButtonItem!
    @IBOutlet weak var AddOrEdit: UIBarButtonItem!

    @IBOutlet weak var Description: UITextField!
    
    var identifier : String!

    
    @IBAction func AddPDF(sender: AnyObject) {
        var description = ""
        //First Round
        let addPDFLinkDescriptionDialogue = UIAlertController(title: "Add PDF Link", message: "Please add a description of the material you are about to add", preferredStyle: UIAlertControllerStyle.Alert)
        addPDFLinkDescriptionDialogue.addTextFieldWithConfigurationHandler(nil)
        addPDFLinkDescriptionDialogue.textFields![0].placeholder = "Enter description of material"
        addPDFLinkDescriptionDialogue.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        
        //First Round Invalid Input
        let addPDFLinkDescriptionDialgueInvalidInput = UIAlertController(title: "Inavlid Input", message: "Please enter a valid description of the material you wish to add", preferredStyle: UIAlertControllerStyle.Alert)
        addPDFLinkDescriptionDialgueInvalidInput.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: { (alert) -> Void in
            self.presentViewController(addPDFLinkDescriptionDialogue, animated: true, completion: nil)}))
        
        //Second Round
        let addPDFLinkDialogue = UIAlertController(title: "Add PDF Link", message: "Enter a valid download URL to your material prefixed with https", preferredStyle: UIAlertControllerStyle.Alert)
        addPDFLinkDialogue.addTextFieldWithConfigurationHandler(nil)
        addPDFLinkDialogue.textFields![0].placeholder = "Enter valid URL"
        addPDFLinkDialogue.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        
        //Second Round Invalid Input
        let addPDFLinkDialogueInvalidInput = UIAlertController(title: "Invalid Input", message: "Please enter a valid URL to your material", preferredStyle: UIAlertControllerStyle.Alert)
        addPDFLinkDialogueInvalidInput.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            self.presentViewController(addPDFLinkDialogue, animated: true, completion: nil)}))

        //Actual Actions
        addPDFLinkDescriptionDialogue.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default, handler: {(alert) -> Void in
            if addPDFLinkDescriptionDialogue.textFields![0].text == "" {
                self.presentViewController(addPDFLinkDescriptionDialgueInvalidInput, animated: true, completion: nil)
            } else {
                description = addPDFLinkDescriptionDialogue.textFields![0].text!
                self.presentViewController(addPDFLinkDialogue, animated: true, completion: nil)
            }
        }))
        
        addPDFLinkDialogue.addAction(UIAlertAction(title: "Add", style: UIAlertActionStyle.Default, handler: {(alert) -> Void in
            if addPDFLinkDialogue.textFields![0].text == "" {
                self.presentViewController(addPDFLinkDialogueInvalidInput, animated: true, completion: nil)
            } else {
                let newPDF = pdfItem(downloadLink: addPDFLinkDialogue.textFields![0].text!, descrip: description)
                self.pdfNotes.append(newPDF)
                self.PDFThumbs.reloadData()
            }
        }))
        self.presentViewController(addPDFLinkDescriptionDialogue, animated: true, completion: nil)
    }
    @IBAction func AddYoutube(sender: AnyObject) {
        var description = ""
        //First Round
        let addYoutubeLinkDescriptionDialogue = UIAlertController(title: "Add YouTube Link", message: "Please add a description of the material you are about to add", preferredStyle: UIAlertControllerStyle.Alert)
        addYoutubeLinkDescriptionDialogue.addTextFieldWithConfigurationHandler(nil)
        addYoutubeLinkDescriptionDialogue.textFields![0].placeholder = "Enter description of the material"
        addYoutubeLinkDescriptionDialogue.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        
        //First Round Invalid Input
        let addYoutubeLinkDescriptionDialgueInvalidInput = UIAlertController(title: "Inavlid Input", message: "Please enter a valid description of the material you wish to add", preferredStyle: UIAlertControllerStyle.Alert)
        addYoutubeLinkDescriptionDialgueInvalidInput.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: { (alert) -> Void in
            self.presentViewController(addYoutubeLinkDescriptionDialogue, animated: true, completion: nil)}))
        
        //Second Round
        let addYoutubeLinkDialogue = UIAlertController(title: "Add YouTube Link", message: "Enter a valid download URL to your material prefixed with https", preferredStyle: UIAlertControllerStyle.Alert)
        addYoutubeLinkDialogue.addTextFieldWithConfigurationHandler(nil)
        addYoutubeLinkDialogue.textFields![0].placeholder = "Enter valid URL"
        addYoutubeLinkDialogue.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        
        //Second Round Invalid Input
        let addYoutubeLinkDialogueInvalidInput = UIAlertController(title: "Invalid Input", message: "Please enter a valid URL to your material", preferredStyle: UIAlertControllerStyle.Alert)
        addYoutubeLinkDialogueInvalidInput.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            self.presentViewController(addYoutubeLinkDialogue, animated: true, completion: nil)}))
        
        //Actual Actions
        addYoutubeLinkDescriptionDialogue.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default, handler: {(alert) -> Void in
            if addYoutubeLinkDescriptionDialogue.textFields![0].text == "" {
                self.presentViewController(addYoutubeLinkDescriptionDialgueInvalidInput, animated: true, completion: nil)
            } else {
                description = addYoutubeLinkDescriptionDialogue.textFields![0].text!
                self.presentViewController(addYoutubeLinkDialogue, animated: true, completion: nil)
            }
        }))
        
        addYoutubeLinkDialogue.addAction(UIAlertAction(title: "Add", style: UIAlertActionStyle.Default, handler: {(alert) -> Void in
            if addYoutubeLinkDialogue.textFields![0].text == "" {
                self.presentViewController(addYoutubeLinkDialogueInvalidInput, animated: true, completion: nil)
            } else {
                let newYT = youtubeItem(downloadLink: addYoutubeLinkDialogue.textFields![0].text!, descrip: description)
                self.youtubeNotes.append(newYT)
                self.YoutubeThumbs.reloadData()
            }
        }))
        self.presentViewController(addYoutubeLinkDescriptionDialogue, animated: true, completion: nil)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        PDFThumbs.dataSource = self
        YoutubeThumbs.dataSource = self
        PDFThumbs.delegate = self
        YoutubeThumbs.delegate = self
        if (noteItem != nil) {
            pdfNotes = noteItem.pdfLinks
            youtubeNotes = noteItem.youtubeLinks
            self.navigationItem.title = "Edit Note"
            CancelOrBack.title = "Back"
            AddOrEdit.title = "Save Changes"
            Description.text = noteItem.description
            identifier = noteItem.identifier
        } else {
            pdfNotes = [pdfItem]()
            youtubeNotes = [youtubeItem]()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        PDFThumbs.reloadData()
        YoutubeThumbs.reloadData()
    }

    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "addNotes" {
            if noteItem != nil {
                let newNote = NoteItem(id : noteItem.identifier, descrip: Description.text!, classN: Class, pdflinks: pdfNotes, youtubelinks: youtubeNotes)
                noteItem = newNote
                return false
            }
            if Description.text == "" {
                let invalidDescriptionAlert = UIAlertController(title: "Invalid Description", message: "Please enter some words describing the topic of your note", preferredStyle: UIAlertControllerStyle.Alert)
                invalidDescriptionAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(invalidDescriptionAlert, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "pdfToWeb" {
            let senderCell = sender as! linkCell
            let destination = segue.destinationViewController as! WebViewController
            destination.pdfitem = senderCell.pdfitem
        } else if segue.identifier == "ytToWeb" {
            let senderCell = sender as! linkCell
            let destination = segue.destinationViewController as! WebViewController
            destination.ytitem = senderCell.ytitem
        }
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print(tableView)
        if tableView == PDFThumbs {
            let cell = tableView.dequeueReusableCellWithIdentifier("pdfCell") as! linkCell
            cell.Description.text = pdfNotes[indexPath.row].description
            cell.pdfitem = pdfNotes[indexPath.row]
            return cell
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("youtubeCell") as! linkCell
        cell.ytDescription.text = youtubeNotes[indexPath.row].description
        cell.ytitem = youtubeNotes[indexPath.row]
        return cell

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == PDFThumbs {
            return pdfNotes.count
        } else if tableView == YoutubeThumbs {
            return youtubeNotes.count
        }
        return 0

    }

}