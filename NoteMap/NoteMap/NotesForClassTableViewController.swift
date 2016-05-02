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
    
    var Notes : [String : NoteItem]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0    }
    
    @IBAction func unwindCancelNotesTableViewController(segue: UIStoryboardSegue) {
        
    }

    @IBAction func unwindAddNotesTableViewController(segue: UIStoryboardSegue) {
        
    }




}