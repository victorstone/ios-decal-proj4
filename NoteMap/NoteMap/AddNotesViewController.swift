
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
    
    @IBOutlet weak var Description: UITextField!
    @IBAction func AddPDF(sender: AnyObject) {
        //First Round
        let addPDFLinkDescriptionDialogue = UIAlertController(title: "Add PDF Link", message: "Please add a description of the material you are about to add", preferredStyle: UIAlertControllerStyle.Alert)
        addPDFLinkDescriptionDialogue.addTextFieldWithConfigurationHandler(nil)
        addPDFLinkDescriptionDialogue.textFields![0].placeholder = "Enter description of material"
        addPDFLinkDescriptionDialogue.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        
        //First Round Invalid Input
        let addPDFLinkDescriptionDialgueInvalidInput = UIAlertController(title: "Inavlid Input", message: "Please enter a valid description of the material you wish to add", preferredStyle: UIAlertControllerStyle.Alert)
        addPDFLinkDescriptionDialgueInvalidInput.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
        
        //Second Round
        let addPDFLinkDialogue = UIAlertController(title: "Add PDF Link", message: "Enter a valid download URL to your material", preferredStyle: UIAlertControllerStyle.Alert)
        addPDFLinkDialogue.addTextFieldWithConfigurationHandler(nil)
        addPDFLinkDialogue.textFields![0].placeholder = "Enter valid URL"
        addPDFLinkDialogue.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        
        
        //Add Actions
        addPDFLinkDialogue.addAction(UIAlertAction(title: "Add", style: UIAlertActionStyle.Default, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>)
    }
    @IBAction func AddYoutube(sender: AnyObject) {
        
    }
    @IBOutlet weak var PDFThumbs: UITableView!
    @IBOutlet weak var YoutubeThumbs: UITableView!
    var pdfNotes : [pdfItem]!
    var youtubeNotes : [youtubeItem]!

    override func viewDidLoad() {
        super.viewDidLoad()
        PDFThumbs.dataSource = self
        YoutubeThumbs.dataSource = self
        PDFThumbs.delegate = self
        YoutubeThumbs.delegate = self
        pdfNotes = [pdfItem]()
        youtubeNotes = [youtubeItem]()
    }

    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "addNote" {
            if Description.text == "" {
                let invalidDescriptionAlert = UIAlertController(title: "Invalid Description", message: "Please enter some words describing the topic of your note", preferredStyle: UIAlertControllerStyle.Alert)
                invalidDescriptionAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
                return false
            }
        }
        return true
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print(tableView)
        if tableView == PDFThumbs {
            let cell = tableView.dequeueReusableCellWithIdentifier("pdfCell") as! linkCell
            cell.Description.text = pdfNotes[indexPath.row].description
            return cell
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("youtubeCell") as! linkCell
        cell.Description.text = youtubeNotes[indexPath.row].description
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