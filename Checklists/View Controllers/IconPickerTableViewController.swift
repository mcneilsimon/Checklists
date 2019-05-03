//
//  IconPickerTableViewController.swift
//  Checklists
//
//  Created by Simon McNeil on 2019-05-01.
//  Copyright © 2019 SimonMcNeil. All rights reserved.
//

import UIKit

protocol IconPickerViewControllerDelegate: class {
    func iconPicker(_ picker: IconPickerTableViewController, didPick iconName: String)
}


class IconPickerTableViewController: UITableViewController {
    
    let icons = ["No Icon", "Appointments", "Birthdays", "Studying", "Chores", "Drinks", "Folder", "Groceries", "Inbox", "Photos", "Trips"]
    
    weak var delegate: IconPickerViewControllerDelegate?
    
    //MARK:- Table View Delegates
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath)
        
        let iconName = icons[indexPath.row]
        cell.textLabel!.text = iconName
        cell.imageView!.image = UIImage(named: iconName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            let iconName = icons[indexPath.row]
            delegate.iconPicker(self, didPick: iconName)
        }
    }
}
