//
//  ViewController.swift
//  TodolistIOS
//
//  Created by failury on 9/10/19.
//  Copyright © 2019 Ruifeng Zhang. All rights reserved.
//

import UIKit
import RealmSwift
class TDLViewController: UITableViewController{

    //MARK: load local data
    var listArray : Results<todoItem>?
    let realm = try! Realm()
    var selectedCategory : Folder? {
    //once the specific category is selected, load the data from database
        didSet{
            loadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: Override TableView methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        if let item = listArray?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.accessoryType = item.mark ? .checkmark : .none
        } else {
            cell.textLabel?.text = "No todoitems at the moment"
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let item = listArray?[indexPath.row] {
            do{
            try realm.write {
                item.mark = !item.mark
            }
            } catch {
                print(error)
            }
        }
        tableView.reloadData()
    }
    //MARK: Plus button
    @IBAction func plusButtonPreseed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let addingPrompt = UIAlertController(title: "Add new Todo", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            if let currentfolder = self.selectedCategory {
                do {
                try self.realm.write {
                    let item = todoItem()
                    item.title = String(textField.text!)
                    item.mark = false
                    currentfolder.todoItems.append(item)
                    
                }
                } catch {
                    print(error)
                }
            }
            self.tableView.reloadData()
            
        }
        addingPrompt.addTextField { (textfield) in
            textfield.placeholder = "Create new item"
            textField = textfield
        }
        addingPrompt.addAction(action)
        present(addingPrompt,animated: true, completion: nil)
    }
    
    func loadData(){
        listArray = selectedCategory!.todoItems.sorted(byKeyPath: "title", ascending: true)
        self.tableView.reloadData()
    }
    
//    func saveData(){
//        do{
//           try context.save()
//        } catch {
//           print("Saving context error\(error)")
//        }
//        self.tableView.reloadData()
//    }
    
    
}
//MARK: Search bar methods
extension TDLViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        listArray = listArray?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "title", ascending: true)

    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            //go back to original list once user clear the textfield
            loadData()
            //relinquish as the first responder
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
