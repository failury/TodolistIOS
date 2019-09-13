//
//  ViewController.swift
//  TodolistIOS
//
//  Created by failury on 9/10/19.
//  Copyright © 2019 Ruifeng Zhang. All rights reserved.
//

import UIKit
import CoreData
class TDLViewController: UITableViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var listArray = [TodoItem]()
    //MARK: load local data
    
    override func viewDidLoad() {
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
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
            let item = TodoItem(context: self.context)
            item.title = String(textField.text!)
            item.mark = false
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
        let request : NSFetchRequest<TodoItem> = TodoItem.fetchRequest()
        do {
           listArray = try context.fetch(request)
            
        } catch {
            print("Fetching error")
        }
        
    }
    
    func saveData(){
        do{
           try context.save()
        } catch {
           print("Saving context error")
        }
        self.tableView.reloadData()
    }
    
}

