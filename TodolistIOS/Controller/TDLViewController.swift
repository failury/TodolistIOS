//
//  ViewController.swift
//  TodolistIOS
//
//  Created by failury on 9/10/19.
//  Copyright © 2019 Ruifeng Zhang. All rights reserved.
//

import UIKit
import CoreData
class TDLViewController: UITableViewController{
    //MARK: load local data
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var listArray = [TodoItem]()
    var selectedCategory : Category? {
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
            item.parentCategory = self.selectedCategory
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
    
    func loadData(with request: NSFetchRequest<TodoItem> = TodoItem.fetchRequest(), predicate: NSPredicate? = nil){
        let categoryPredicate = NSPredicate(format: "parentCategory.categoryName MATCHES %@", selectedCategory!.categoryName!)
        if let additionalPredicate = predicate {
            // for searching todo items case
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
        } else {
            request.predicate = categoryPredicate
        }

        do {
           listArray = try context.fetch(request)
            
        } catch {
            print("Fetching error\(error)")
        }
        self.tableView.reloadData()
    }
    
    func saveData(){
        do{
           try context.save()
        } catch {
           print("Saving context error\(error)")
        }
        self.tableView.reloadData()
    }
    
    
}
//MARK: Search bar methods
extension TDLViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request: NSFetchRequest<TodoItem> = TodoItem.fetchRequest()
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        //sort the data in ascend order
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        //update the table
        loadData(with: request, predicate: predicate)

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
