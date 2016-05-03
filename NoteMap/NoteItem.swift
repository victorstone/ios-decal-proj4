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
    var pdfLinks : [pdfItem]!
    var youtubeLinks : [youtubeItem]!
    var className : String!
    var identifier : String!
    
    init(id : String, descrip : String, classN : String, pdflinks: [pdfItem], youtubelinks : [youtubeItem]) {
        description = descrip
        className = classN
        pdfLinks = pdflinks
        youtubeLinks = youtubelinks
        identifier = id
        
    }
    
}
