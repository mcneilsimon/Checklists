//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Simon McNeil on 2019-04-23.
//  Copyright © 2019 SimonMcNeil. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    
    
    func toggleChecked() {
        checked = !checked
    }
}
