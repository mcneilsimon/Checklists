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
    var iconName: String

    var items = [ChecklistItem]()
    
    /*Inits are also usefull for when we create an object and we want that object to have a property. Here we created a default
     parameter value for the iconName. Sets a default value to omit filling in the parameter value when calling the method,
     but can replace it with a different string value if you want. Checklist(name:) or Checklist(name:,iconName:)*/
    init(name: String, iconName: String = "Folder") {
        self.name = name
        self.iconName = iconName
    }
    
    //If the items checked mark property is set to false we increment the counter
    //count is the returned value and item is the model type that we are seeing if its checked property is true or false
    func countUncheckedItems() -> Int {
        return items.reduce(0) { count, item in count + (item.checked ? 0 : 1) }
    }
}
