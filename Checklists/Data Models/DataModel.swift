//
//  DataModel.swift
//  Checklists
//
//  Created by Simon McNeil on 2019-04-30.
//  Copyright © 2019 SimonMcNeil. All rights reserved.
//

import Foundation

class DataModel {
    
    var lists = [Checklist]()
    
    init() {
        loadChecklists()
        registerDefaults()
        handleFirstTime()
    }
    
    //stores index of selected checklist to navigate to checklists to-do when app re-launches after a crash
    var indexOfSelectedChecklist: Int {
        get {
            return UserDefaults.standard.integer(forKey: "ChecklistIndex")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "ChecklistIndex")
        }
    }
    
    //MARK:- Data Persistance (Saving and Loading)
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    
    //Method takes the contents of the Checklists array, converts it to a block of binary data, and then writes this data to a file
    func saveChecklists() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(lists)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding array: \(error.localizedDescription)")
        }
    }
    
    func loadChecklists() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                lists = try decoder.decode([Checklist].self, from: data)
                sortChecklist()
            } catch {
                print("Error encoding array: \(error.localizedDescription)")
            }
        }
    }
    
    func registerDefaults() {
        //checks for row index and see if user has launched the app before.
        let dictionary = ["ChecklistIndex": -1, "FirstTime": true] as [String: Any]
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    func handleFirstTime() {
        //retrieve the FirstTime value in our user defaults
        let userDefaults = UserDefaults.standard
        let firstTime = userDefaults.bool(forKey: "FirstTime")
        
        if firstTime {
            let checklist = Checklist(name: "List")
            lists.append(checklist)
            
            indexOfSelectedChecklist = 0
            userDefaults.set(false, forKey: "FirstTime")
            userDefaults.synchronize()
        }
    }
    
    func sortChecklist() {
        lists.sort(by: {list1, list2 in return list1.name.localizedStandardCompare(list2.name) == .orderedAscending})
    }
    
    class func nextChecklistItemID() -> Int {
        let userDefaults = UserDefaults.standard
        let itemID = userDefaults.integer(forKey: "ChecklistItemID")
        userDefaults.set(itemID + 1, forKey: "ChecklistItemID")
        
        /* userDefaults.synchronize() is to force UserDefaults to write these changes to the disk immediately
           — that way, they won’t get lost if you kill the app from Xcode before it had a chance to save, or the app crashed for some reason.”
        */
        userDefaults.synchronize()
        return itemID
    }
}
