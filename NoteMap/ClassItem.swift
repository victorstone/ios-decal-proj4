//
//  ClassObject.swift
//  NoteMap
//
//  Created by Victor Stone on 4/27/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import Foundation
import UIKit

class ClassItem{
    
    var numNotes : Int!
    var className : String!
    var lastEdited : NSDate!
    var subject : String!
    var Notes : [NoteItem]!
    
    init(name : String, sub : String) {
        lastEdited = NSDate()
        Notes = [NoteItem]()
        numNotes = 0
        className = name
        subject = sub
    }
}

