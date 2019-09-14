//
//  CategoryTableViewController.swift
//  TodolistIOS
//
//  Created by failury on 9/13/19.
//  Copyright © 2019 Ruifeng Zhang. All rights reserved.
//

import UIKit
import CoreData
class CategoryTableViewController: UITableViewController {
    //MARK: load local data
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var categoryArray = [Category]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }



    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let addingPrompt = UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let category = Category(context: self.context)
            category.categoryName = String(textField.text!)
            self.categoryArray.append(category)
            self.saveData()
        }
        addingPrompt.addTextField { (textfield) in
            textfield.placeholder = "Enter New Category Name"
            textField = textfield
        }
        addingPrompt.addAction(action)
        present(addingPrompt,animated: true, completion: nil)
    }
    //MARK: TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categoryArray[indexPath.row].categoryName
        return cell
    }

    //MARK: TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TO DO: goto todolist view
        performSegue(withIdentifier: "CategoryToItems", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! TDLViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationViewController.selectedCategory = categoryArray[indexPath.row]
        }
        }
        
    //MARK: Data Manipulation Methods
    func loadData(with request: NSFetchRequest<Category> = Category.fetchRequest()){
        do {
            categoryArray = try context.fetch(request)
            
        } catch {
            print("Fetching error\(error)")
        }
        tableView.reloadData()
    }
    func saveData(){
        do{
            try context.save()
        } catch {
            print("Saving context error\(error)")
        }
        tableView.reloadData()
    }
}
