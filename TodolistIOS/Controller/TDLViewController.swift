//
//  ViewController.swift
//  TodolistIOS
//
//  Created by failury on 9/10/19.
//  Copyright © 2019 Ruifeng Zhang. All rights reserved.
//

import UIKit

class TDLViewController: UITableViewController {
    var listArray = [TodoItem]()
    //MARK: load local data
    let dataFileDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Data.plist")
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadData()
    }
    //MARK: Override TableView methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        cell.textLabel?.text = listArray[indexPath.row].title
        cell.accessoryType = listArray[indexPath.row].mark ? .checkmark : .none
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        listArray[indexPath.row].mark = !listArray[indexPath.row].mark
        saveData()
    }
    //MARK: Plus button
    @IBAction func plusButtonPreseed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let addingPrompt = UIAlertController(title: "Add new Todo", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let item = TodoItem()
            item.title = String(textField.text!)
            self.listArray.append(item)
            self.saveData()
        }
        addingPrompt.addTextField { (textfield) in
            textfield.placeholder = "Create new item"
            textField = textfield
        }
        addingPrompt.addAction(action)
        present(addingPrompt,animated: true, completion: nil)
    }
    
    func loadData(){
        if let data = try? Data(contentsOf: dataFileDirectory!) {
        let decoder = PropertyListDecoder()
            do {
                listArray = try decoder.decode([TodoItem].self, from: data)
            } catch {
                print("Decoding error")
            }
        
        
        }
    }
    
    func saveData(){
        let encoder = PropertyListEncoder()
        do{
            let todoData = try encoder.encode(self.listArray)
            try todoData.write(to: self.dataFileDirectory!)
        } catch {
            print("Encoding error")
        }
        self.tableView.reloadData()
    }
    
}

