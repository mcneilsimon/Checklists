//
//  Checklist.swift
//  Checklists
//
//  Created by Simon McNeil on 2019-04-29.
//  Copyright © 2019 SimonMcNeil. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    
    var name: String
    var items = [ChecklistItem]()
    
    //Inits are also usefull for when we create an object and we want that object to have a property
    init(name: String) {
        self.name = name
    }
}
