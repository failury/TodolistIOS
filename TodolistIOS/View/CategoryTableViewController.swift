//
//  CategoryTableViewController.swift
//  TodolistIOS
//
//  Created by failury on 9/13/19.
//  Copyright © 2019 Ruifeng Zhang. All rights reserved.
//

import UIKit
import RealmSwift
class CategoryTableViewController: UITableViewController {
    //MARK: load local data
    let realm = try! Realm()
    var folderArray : Results<Folder>?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFolders()
    }



    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let addingPrompt = UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let folder = Folder()
            folder.folderName = String(textField.text!)
            self.saveFolders(folder: folder)
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
        return folderArray?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = folderArray?[indexPath.row].folderName ?? "Nothing added yet "
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
            destinationViewController.selectedCategory = folderArray?[indexPath.row]
        }
        }
        
    //MARK: Data Manipulation Methods
    func loadFolders(){
        folderArray = realm.objects(Folder.self)
        tableView.reloadData()
    }
    func saveFolders(folder: Folder){
        do{
            try realm.write {
                realm.add(folder)
            }
        } catch {
            print("Saving context error\(error)")
        }
        tableView.reloadData()
    }
}
