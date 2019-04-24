//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Simon McNeil on 2019-04-24.
//  Copyright © 2019 SimonMcNeil. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
    }
    
    //MARK:- Tells the navigation controller to close the Add Item screen with an animation to go back to the previous screen, 
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }

}
