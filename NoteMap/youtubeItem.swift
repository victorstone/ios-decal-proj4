//
//  youtubeItem.swift
//  NoteMap
//
//  Created by Victor Stone on 5/2/16.
//  Copyright © 2016 Victor Stone. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class youtubeItem {
    var link : String!
    var description : String!
    var linkURL : NSURL!
    
    init(downloadLink : String, descrip : String) {
        description = descrip
        link = downloadLink
        linkURL = NSURL(string: link)
    }
}