//
//  NoteCell.swift
//  NoteMap
//
//  Created by Victor Stone on 4/29/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class NoteItem {
    
    var description : String!
    var pdfLinks : [String]!
    var youTubeLinks : [String]!
    var className : String!
    
    init(descrip : String, classN : String) {
        description = descrip
        className = classN
    }
    
}
