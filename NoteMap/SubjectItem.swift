//
//  Subject.swift
//  NoteMap
//
//  Created by Victor Stone on 4/30/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import Foundation
import UIKit

class SubjectItem {
    
    var numNotes : Int!
    var subjectName : String!
    var lastEdited : NSDate!
    var numClasses : Int!
    
    init(name : String) {
        numNotes = 0
        subjectName = name
        lastEdited = NSDate()
        numClasses = 0
    }
    
}
